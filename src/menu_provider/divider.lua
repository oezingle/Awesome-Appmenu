
local class = require("8ea8535f-6950-4d47-9904-c09f5ea7f92b.dep.lib.30log")

local Promise = require("8ea8535f-6950-4d47-9904-c09f5ea7f92b.dep.src.util.Promise")

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