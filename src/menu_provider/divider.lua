
local class = require("a0e6c2e1-f66a-4a00-838a-f9bb0808f5ad.dep.lib.30log")

local Promise = require("a0e6c2e1-f66a-4a00-838a-f9bb0808f5ad.dep.src.util.Promise")

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