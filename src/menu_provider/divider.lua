
local class = require("a6104196-cea0-461f-88ee-9e673cbec7ea.dep.lib.30log")

local Promise = require("a6104196-cea0-461f-88ee-9e673cbec7ea.dep.src.util.Promise")

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