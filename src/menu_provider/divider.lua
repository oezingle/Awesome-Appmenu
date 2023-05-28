
local class = require("fd5d405c-8daf-49cc-b809-0665a9d3b1f7.dep.lib.30log")

local Promise = require("fd5d405c-8daf-49cc-b809-0665a9d3b1f7.dep.src.util.Promise")

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