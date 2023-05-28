
local class = require("73b08e77-9523-460d-a24a-9739f3229cce.dep.lib.30log")

local Promise = require("73b08e77-9523-460d-a24a-9739f3229cce.dep.src.util.Promise")

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