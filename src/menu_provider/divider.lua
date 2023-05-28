
local class = require("9e195806-d7a1-4cc1-8a6f-bd34d5804f51.dep.lib.30log")

local Promise = require("9e195806-d7a1-4cc1-8a6f-bd34d5804f51.dep.src.util.Promise")

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