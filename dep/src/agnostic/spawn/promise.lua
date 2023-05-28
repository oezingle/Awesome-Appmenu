--- required by build/appmenu/src/menu_provider/gtk/init.lua
--- required by build/appmenu/src/cli.lua

local spawn = require("c69641ce-2aab-4455-bee4-a752d0ef1018.dep.src.agnostic.spawn")
local Promise = require("c69641ce-2aab-4455-bee4-a752d0ef1018.dep.src.util.Promise")

---@param command string
---@return Promise
local function spawn_promise (command)
    return Promise(function (res)
        spawn(command, res)
    end)
end

return spawn_promise