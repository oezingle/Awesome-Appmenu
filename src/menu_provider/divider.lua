
local class = require("03c9e770-baa2-402b-afa3-29d14e6fdf64.dep.lib.30log")

local Promise = require("03c9e770-baa2-402b-afa3-29d14e6fdf64.dep.src.util.Promise")

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