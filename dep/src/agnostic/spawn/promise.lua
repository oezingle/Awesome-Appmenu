--- required by build/appmenu/src/menu_provider/gtk/init.lua
--- required by build/appmenu/src/cli.lua

local spawn = require("bf1098fc-5829-4aa0-bc12-53b6e0a3a32a.dep.src.agnostic.spawn")
local Promise = require("bf1098fc-5829-4aa0-bc12-53b6e0a3a32a.dep.src.util.Promise")

---@param command string
---@return Promise
local function spawn_promise (command)
    return Promise(function (res)
        spawn(command, res)
    end)
end

return spawn_promise