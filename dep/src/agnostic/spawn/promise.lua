--- required by build/appmenu/src/menu_provider/gtk/init.lua
--- required by build/appmenu/src/cli.lua

local spawn = require("90b7ef7c-8776-436e-8aff-e82a9209bd2c.dep.src.agnostic.spawn")
local Promise = require("90b7ef7c-8776-436e-8aff-e82a9209bd2c.dep.src.util.Promise")

---@param command string
---@return Promise
local function spawn_promise (command)
    return Promise(function (res)
        spawn(command, res)
    end)
end

return spawn_promise