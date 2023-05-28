
local class = require("d8f35b55-0b0f-41bf-8968-849b9a00e323.dep.lib.30log")

local Promise = require("d8f35b55-0b0f-41bf-8968-849b9a00e323.dep.src.util.Promise")

---@class DividerMenuItem : MenuItem
local divider_item = class("DividerMenuItem", {
    label = ""
})

function divider_item.activate()
    return Promise.resolve(false)
end

function divider_item.get_children()
    return Promise.resolve({})
end

function divider_item.has_children()
    return Promise.resolve(false)
end

return divider_item