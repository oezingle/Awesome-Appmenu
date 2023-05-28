local class = require("1309acd9-7750-4674-ac1c-47ed92eb73e0.dep.lib.30log")
local Promise = require("1309acd9-7750-4674-ac1c-47ed92eb73e0.dep.src.util.Promise")

local menu_provider = class("menu provider", {
    MENU_TYPE = "base"
})

---@alias MenuInfo { service: string, path: string }

---@class MenuItem : Log.BaseFunctions
---@field activate fun(self: MenuItem): Promise<boolean>
---@field get_children fun(self: MenuItem): Promise<MenuItem[]>
---@field has_children fun(self: MenuItem): Promise<boolean>
---@field label string?
---@field shortcut string[]?

---@alias MenuSection { type: "section", items: MenuItem[] }

---@class MenuProvider : Log.BaseFunctions
---@field client Client
---@field provides fun(client: Client): Promise<boolean>
---@field setup fun(): Promise|any|nil
---@field get_menu fun(): MenuItem
---@field on_activate nil|fun(): any
---@field MENU_TYPE string

---@param client Client
function menu_provider:init(client)
    self.client = client
end

--- check if this menu_provider works for a given client
---@param client Client
---@return Promise<boolean>
function menu_provider.provides(client)
    return Promise.resolve(nil)
end

function menu_provider:get_menu()

end

return menu_provider
