
local class = require("bf1098fc-5829-4aa0-bc12-53b6e0a3a32a.dep.lib.30log")

local Promise = require("bf1098fc-5829-4aa0-bc12-53b6e0a3a32a.dep.src.util.Promise")

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