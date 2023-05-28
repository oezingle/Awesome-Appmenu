
local class = require("0045eaaf-17bd-4d4e-90f6-dff216a49d23.dep.lib.30log")

local Promise = require("0045eaaf-17bd-4d4e-90f6-dff216a49d23.dep.src.util.Promise")

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