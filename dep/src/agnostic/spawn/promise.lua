--- required by build/appmenu/src/menu_provider/gtk/init.lua
--- required by build/appmenu/src/cli.lua

local spawn = require("9e195806-d7a1-4cc1-8a6f-bd34d5804f51.dep.src.agnostic.spawn")
local Promise = require("9e195806-d7a1-4cc1-8a6f-bd34d5804f51.dep.src.util.Promise")

---@param command string
---@return Promise
local function spawn_promise (command)
    return Promise(function (res)
        spawn(command, res)
    end)
end

return spawn_promise