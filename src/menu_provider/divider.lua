
local class = require("c0c39dce-d76e-4053-a681-e84b8d58ab49.dep.lib.30log")

local Promise = require("c0c39dce-d76e-4053-a681-e84b8d58ab49.dep.src.util.Promise")

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