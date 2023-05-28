
local class = require("90b7ef7c-8776-436e-8aff-e82a9209bd2c.dep.lib.30log")

local Promise = require("90b7ef7c-8776-436e-8aff-e82a9209bd2c.dep.src.util.Promise")

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