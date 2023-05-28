
local class = require("e5cdbf3b-be78-4d9e-a1e4-b7d62346b438.dep.lib.30log")

local Promise = require("e5cdbf3b-be78-4d9e-a1e4-b7d62346b438.dep.src.util.Promise")

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