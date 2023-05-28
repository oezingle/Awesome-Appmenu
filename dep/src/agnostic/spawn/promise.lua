--- required by build/appmenu/src/menu_provider/gtk/init.lua
--- required by build/appmenu/src/cli.lua

local spawn = require("0045eaaf-17bd-4d4e-90f6-dff216a49d23.dep.src.agnostic.spawn")
local Promise = require("0045eaaf-17bd-4d4e-90f6-dff216a49d23.dep.src.util.Promise")

---@param command string
---@return Promise
local function spawn_promise (command)
    return Promise(function (res)
        spawn(command, res)
    end)
end

return spawn_promise