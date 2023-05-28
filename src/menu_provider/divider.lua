
local class = require("c3aea7c1-095b-4150-88c1-19fda04cc188.dep.lib.30log")

local Promise = require("c3aea7c1-095b-4150-88c1-19fda04cc188.dep.src.util.Promise")

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