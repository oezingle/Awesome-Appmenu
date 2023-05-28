--- required by build/appmenu/src/menu_provider/gtk/init.lua
--- required by build/appmenu/src/cli.lua

local spawn = require("a6104196-cea0-461f-88ee-9e673cbec7ea.dep.src.agnostic.spawn")
local Promise = require("a6104196-cea0-461f-88ee-9e673cbec7ea.dep.src.util.Promise")

---@param command string
---@return Promise
local function spawn_promise (command)
    return Promise(function (res)
        spawn(command, res)
    end)
end

return spawn_promise