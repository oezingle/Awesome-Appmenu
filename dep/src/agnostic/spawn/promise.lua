--- required by build/appmenu/src/menu_provider/gtk/init.lua
--- required by build/appmenu/src/cli.lua

local spawn = require("2976cd09-044b-4491-85fc-7bd82aaa8fb9.dep.src.agnostic.spawn")
local Promise = require("2976cd09-044b-4491-85fc-7bd82aaa8fb9.dep.src.util.Promise")

---@param command string
---@return Promise
local function spawn_promise (command)
    return Promise(function (res)
        spawn(command, res)
    end)
end

return spawn_promise