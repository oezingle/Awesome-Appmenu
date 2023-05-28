--- required by build/appmenu/src/menu_provider/gtk/init.lua
--- required by build/appmenu/src/cli.lua

local spawn = require("c0c39dce-d76e-4053-a681-e84b8d58ab49.dep.src.agnostic.spawn")
local Promise = require("c0c39dce-d76e-4053-a681-e84b8d58ab49.dep.src.util.Promise")

---@param command string
---@return Promise
local function spawn_promise (command)
    return Promise(function (res)
        spawn(command, res)
    end)
end

return spawn_promise