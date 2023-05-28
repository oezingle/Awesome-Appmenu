--- required by build/appmenu/src/menu_provider/gtk/init.lua
--- required by build/appmenu/src/cli.lua

local spawn = require("a8ab7585-1a17-4fa5-80cc-467ce1f81042.dep.src.agnostic.spawn")
local Promise = require("a8ab7585-1a17-4fa5-80cc-467ce1f81042.dep.src.util.Promise")

---@param command string
---@return Promise
local function spawn_promise (command)
    return Promise(function (res)
        spawn(command, res)
    end)
end

return spawn_promise