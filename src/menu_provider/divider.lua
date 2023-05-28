
local class = require("9793106b-df92-41a0-a00d-28bc407b04e7.dep.lib.30log")

local Promise = require("9793106b-df92-41a0-a00d-28bc407b04e7.dep.src.util.Promise")

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