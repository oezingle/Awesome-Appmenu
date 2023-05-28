
local class = require("6988790a-3167-4de7-93c3-c29651a262e8.dep.lib.30log")

local Promise = require("6988790a-3167-4de7-93c3-c29651a262e8.dep.src.util.Promise")

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