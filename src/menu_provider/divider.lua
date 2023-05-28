
local class = require("b4b8790a-35d0-429d-b907-58371e9ded29.dep.lib.30log")

local Promise = require("b4b8790a-35d0-429d-b907-58371e9ded29.dep.src.util.Promise")

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