
local class = require("c1a7b0b2-8d53-4d76-9f91-337bcec5604b.dep.lib.30log")

local Promise = require("c1a7b0b2-8d53-4d76-9f91-337bcec5604b.dep.src.util.Promise")

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