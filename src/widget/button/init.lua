local class                 = require("9e195806-d7a1-4cc1-8a6f-bd34d5804f51.dep.lib.30log")
local parse_widget_template = require("9e195806-d7a1-4cc1-8a6f-bd34d5804f51.src.parse_widget_template")

local awful                 = require("awful")
local gtimer                = require("gears.timer")

local no_scroll             = require("9e195806-d7a1-4cc1-8a6f-bd34d5804f51.dep.src.widgets.helper.function.no_scroll")

local appmenu               = require("9e195806-d7a1-4cc1-8a6f-bd34d5804f51.src.appmenu")

local default_button        = require("9e195806-d7a1-4cc1-8a6f-bd34d5804f51.src.widget.button.default")
local default_divider       = require("9e195806-d7a1-4cc1-8a6f-bd34d5804f51.src.widget.button.default.divider")

---@module "widget.menu"
local menu_builder

---@alias MenuLayout { layout: "vertical" | "horizontal", popup_direction: Direction, click_focus: boolean?, has_focus: boolean? }
---@alias LayoutTable table<number|"default", MenuLayout>

-- TODO highlight keyboard shortcuts if using keyboard control
-- Reformat text to bold on keyboard::activate signal?

---@class MenuButton : Log.BaseFunctions
---@operator call:MenuButton
---@field menu_item MenuItem
---@field parent MenuBuilder|nil a parent widget
---@field popup_direction Direction the direction the popup faces
---@field popup table|nil the popup for this menu's children
---@field widget table the button widget itself
---@field layout_table LayoutTable the table of popup directions, button widget layouts, and click focus rules for all menus and menu buttons
---@field layout_table_entry MenuLayout the menu layout table entry that reflects the depth of this button
---@field depth number
---@field click_focus boolean
---@field child MenuBuilder|nil
---@field is_hovered boolean
local menu_button           = class("MenuButton")

---@param menu_item MenuItem
function menu_button:init(menu_item)
    self.menu_item = menu_item

    self:set_popup_direction("right")

    self.click_focus = false
    self.is_hovered = false
end

---@param parent MenuBuilder a parent widget
---@return self self for convienience
function menu_button:set_parent(parent)
    self.parent = parent

    return self
end

--- Set the layout and direction table
---@param table LayoutTable
---@param depth number?
function menu_button:set_layout_table(table, depth)
    depth = depth or 1
    self.depth = depth

    self.layout_table = table

    self.layout_table_entry = table[self.depth] or table.default

    self:set_popup_direction(self.layout_table_entry.popup_direction)

    self.click_focus = self.layout_table_entry.click_focus or false

    self:_create_widget()

    return self
end

---@param popup_direction Direction
---@return self self for convienience
function menu_button:set_popup_direction(popup_direction)
    self.popup_direction = popup_direction

    return self
end

function menu_button:_format_label()
    local is_keygrabbing = false

    return self.menu_item.label:gsub("_([%a%d])", is_keygrabbing and "<u>%1</u>" or "%1")
end

function menu_button:activate()
    self.menu_item:activate()
        :after(function(activated)
            if activated and self.parent then
                self.parent.widget:emit_signal("menu_item::child::activated")
            end
        end)
        :catch(function(err)
            self.parent.widget:emit_signal("menu_item::error", err)
        end)
end

function menu_button:_create_popup()
    local appmenu_config = appmenu.get_config()

    -- TODO remove config references
    self.popup = awful.popup {
        widget = self.child
            :get_widget(),

        ontop = true,
        visible = false,

        bg = appmenu_config.popup.bg,
        fg = appmenu_config.popup.fg,

        shape = appmenu_config.popup.shape
    }

    self.popup:connect_signal("mouse::leave", function()
        self:_on_mouse_leave()
    end)

    awful.placement.next_to(self.popup, {
        geometry = mouse.current_widget_geometry,
        preferred_positions = { self.popup_direction },
        preferred_anchors = { 'front' },
    })

    do
        local offset = appmenu_config.popup.offset
        if offset then
            if type(offset.x) == "number" then
                self.popup.x = self.popup.x + offset.x
            elseif type(offset.x) == "table" then
                -- Get the entry for this depth
                local xoffset = offset.x[self.depth]

                if xoffset then
                    self.popup.x = self.popup.x + xoffset
                end
            end

            if type(offset.y) == "number" then
                self.popup.y = self.popup.y + offset.y
            elseif type(offset.y) == "table" then
                local yoffset = offset.y[self.depth]

                if yoffset then
                    self.popup.y = self.popup.y + yoffset
                end
            end
        end
    end
end

-- TODO popups don't cause leaving

-- TODO remove predetermined colors - appmenu.get_config().hover_color?
function menu_button:hover()
    local appmenu_config = appmenu.get_config()

    if self.parent then
        self.parent:leave_children()
    end

    self.widget.bg = appmenu_config.button_hover_color

    self.is_hovered = true

    -- shout out MACM 101 - A -> B <=> ~A v B
    -- keep the menu item from getting too excited if click
    -- focus is enabled and the menu item isn't clicked yet
    if not self.click_focus or self.layout_table_entry.has_focus then
        self.menu_item:has_children()
            :after(function(has_children)
                if not has_children then
                    return
                end

                self.child = menu_builder()
                    :set_layout_table(self.layout_table, self.depth + 1)
                    :set_menu_item(self.menu_item)
                    :set_popup_direction(self.popup_direction)
                    :set_parent(self)

                if self.popup then
                    self.popup.widget = self.child
                        :get_widget()
                else
                    self:_create_popup()
                end

                --[[
                local mgeo = mouse.current_widget_geometry

                ---@type Geometry | nil
                local geo = mgeo and {
                    x = mgeo.x,
                    y = mgeo.y + mgeo.height,
                    width = mgeo.width,
                    height = 0
                } or nil

                -- move to mouse
                ]]
                self.popup.visible = true
            end)
            :catch(function(err)
                self.widget:emit_signal("menu_item::error", err)
            end)
    end
end

--- Check if the child menu has a hovered item
function menu_button:child_hovered()
    if self.child and (self.child:child_hovered() or self.child.is_hovered) then
        return true
    else
        return false
    end
end

--- Close the popup
---@param force boolean? if the widget should ignore the mouse
function menu_button:leave(force)
    -- Don't close if an item in a child menu is hovered
    if not force and self:child_hovered() then
        return
    end

    if self.popup then
        self.popup.visible = false

        self.popup = nil
    end

    self.is_hovered = false

    self.widget.bg = nil
end

-- Fire the leaving signal with some delay so that
-- if a child has the mouse, the popup doesn't close
function menu_button:_on_mouse_leave()
    gtimer {
        -- TODO configurable timeout
        timeout     = 0.5,
        single_shot = true,
        autostart   = true,
        callback    = function()
            self:leave()
        end
    }
end

-- TODO icons - esp for KDE apps
function menu_button:_create_widget()
    local button = nil

    if self.menu_item.label == "" then
        button = parse_widget_template(appmenu.get_config().divider_template or default_divider)
    else
        local template = appmenu.get_config().button_template

        if type(template) == "table" and (template.vertical or template.horizontal) then
            if self.depth == 1 then
                button = parse_widget_template(template.horizontal or default_button)
            else
                button = parse_widget_template(template.vertical or default_button)
            end
        else
            button = parse_widget_template(template or default_button)
        end

        for _, child in ipairs(button:get_children_by_id("text-role")) do
            child.markup = self:_format_label()
        end

        if self.depth ~= 1 then
            self.menu_item:has_children():after(function(children)
                for _, child in ipairs(button:get_children_by_id("shortcut-role")) do
                    if children then
                        child.text = appmenu.get_config().shortcut_symbols.children
                    elseif self.menu_item.shortcut then
                        local shortcut = ""

                        for _, key in ipairs(self.menu_item.shortcut) do
                            local char = appmenu.get_config().shortcut_symbols[key] or string.upper(key)

                            shortcut = shortcut .. char
                        end

                        child.text = shortcut
                    end

                    -- TODO keyboard shortucts yay
                end
            end)
        end

        button:connect_signal("button::press", no_scroll(function()
            if self.click_focus then
                self.layout_table_entry.has_focus = not self.layout_table_entry.has_focus

                if self.layout_table_entry.has_focus then
                    self:hover()
                else
                    self:leave()
                end
            else
                self:activate()
            end
        end))

        --[[
        local mouse_leave_timer = gtimer {
            timeout = 0.2,
            single_shot = true,

            callback = function()
                self:leave()
            end
        }
        ]]
        button:connect_signal("mouse::enter", function()
            self:hover()

            -- if mouse_leave_timer.started then
            --     mouse_leave_timer:stop()
            -- end
        end)

        button:connect_signal("mouse::leave", function(widget)
            self.is_hovered = false

            -- mouse_leave_timer:start()

            self:_on_mouse_leave()

            widget.bg = nil
        end)

        button:connect_signal("menu_item::child::activated", function()
            if self.layout_table_entry.has_focus then
                self.layout_table_entry.has_focus = false
            end

            self:leave(true)

            if self.parent then
                self.parent.widget:emit_signal("menu_item::child::activated")
            end
        end)

        button:connect_signal("menu_item::error", function(err)
            if self.parent then
                self.parent.widget:emit_signal("menu_item::error", err)
            end
        end)
    end

    self.widget = button
end

function menu_button:get_widget()
    return self.widget
end

--- A really stupid function
---@param menu_builder_ MenuBuilder
function menu_button.set_menu_builder(menu_builder_)
    menu_builder = menu_builder_
end

return menu_button
