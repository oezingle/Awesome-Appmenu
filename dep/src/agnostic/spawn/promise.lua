--- required by build/appmenu/src/menu_provider/gtk/init.lua
--- required by build/appmenu/src/cli.lua

local spawn = require("1309acd9-7750-4674-ac1c-47ed92eb73e0.dep.src.agnostic.spawn")
local Promise = require("1309acd9-7750-4674-ac1c-47ed92eb73e0.dep.src.util.Promise")

---@param command string
---@return Promise
local function spawn_promise (command)
    return Promise(function (res)
        spawn(command, res)
    end)
end

return spawn_promise