
local class = require("682ee8d0-7e5d-4188-8d1d-853a7e7ef3ee.dep.lib.30log")

local Promise = require("682ee8d0-7e5d-4188-8d1d-853a7e7ef3ee.dep.src.util.Promise")

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