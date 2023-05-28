--- required by build/appmenu/src/menu_provider/gtk/init.lua
--- required by build/appmenu/src/cli.lua

local spawn = require("e5cdbf3b-be78-4d9e-a1e4-b7d62346b438.dep.src.agnostic.spawn")
local Promise = require("e5cdbf3b-be78-4d9e-a1e4-b7d62346b438.dep.src.util.Promise")

---@param command string
---@return Promise
local function spawn_promise (command)
    return Promise(function (res)
        spawn(command, res)
    end)
end

return spawn_promise