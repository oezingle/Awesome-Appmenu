
local class = require("c69641ce-2aab-4455-bee4-a752d0ef1018.dep.lib.30log")

local Promise = require("c69641ce-2aab-4455-bee4-a752d0ef1018.dep.src.util.Promise")

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