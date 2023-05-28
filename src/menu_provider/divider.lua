
local class = require("1309acd9-7750-4674-ac1c-47ed92eb73e0.dep.lib.30log")

local Promise = require("1309acd9-7750-4674-ac1c-47ed92eb73e0.dep.src.util.Promise")

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