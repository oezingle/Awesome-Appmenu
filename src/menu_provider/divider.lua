
local class = require("0f69ccdb-581a-4a4e-8d48-475e9cebc6ea.dep.lib.30log")

local Promise = require("0f69ccdb-581a-4a4e-8d48-475e9cebc6ea.dep.src.util.Promise")

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