--- required by build/appmenu/src/menu_provider/gtk/init.lua
--- required by build/appmenu/src/cli.lua

local spawn = require("a0e6c2e1-f66a-4a00-838a-f9bb0808f5ad.dep.src.agnostic.spawn")
local Promise = require("a0e6c2e1-f66a-4a00-838a-f9bb0808f5ad.dep.src.util.Promise")

---@param command string
---@return Promise
local function spawn_promise (command)
    return Promise(function (res)
        spawn(command, res)
    end)
end

return spawn_promise