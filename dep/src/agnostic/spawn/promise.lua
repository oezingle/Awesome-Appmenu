--- required by build/appmenu/src/menu_provider/gtk/init.lua
--- required by build/appmenu/src/cli.lua

local spawn = require("8ea8535f-6950-4d47-9904-c09f5ea7f92b.dep.src.agnostic.spawn")
local Promise = require("8ea8535f-6950-4d47-9904-c09f5ea7f92b.dep.src.util.Promise")

---@param command string
---@return Promise
local function spawn_promise (command)
    return Promise(function (res)
        spawn(command, res)
    end)
end

return spawn_promise