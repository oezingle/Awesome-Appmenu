
local class = require("6c6bb20a-bfed-47e3-8066-4852e63145a1.dep.lib.30log")

local Promise = require("6c6bb20a-bfed-47e3-8066-4852e63145a1.dep.src.util.Promise")

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