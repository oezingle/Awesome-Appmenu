
local class = require("2976cd09-044b-4491-85fc-7bd82aaa8fb9.dep.lib.30log")

local Promise = require("2976cd09-044b-4491-85fc-7bd82aaa8fb9.dep.src.util.Promise")

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