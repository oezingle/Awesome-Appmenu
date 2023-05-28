
local class = require("0e720573-7213-4daa-b87b-0bd875ae02bb.dep.lib.30log")

local Promise = require("0e720573-7213-4daa-b87b-0bd875ae02bb.dep.src.util.Promise")

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