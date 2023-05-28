
local class = require("a8ab7585-1a17-4fa5-80cc-467ce1f81042.dep.lib.30log")

local Promise = require("a8ab7585-1a17-4fa5-80cc-467ce1f81042.dep.src.util.Promise")

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