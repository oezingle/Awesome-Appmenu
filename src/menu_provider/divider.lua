
local class = require("f31759d0-79d2-47e6-8171-306bdcf3a135.dep.lib.30log")

local Promise = require("f31759d0-79d2-47e6-8171-306bdcf3a135.dep.src.util.Promise")

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