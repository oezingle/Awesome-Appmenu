--- required by build/appmenu/src/menu_provider/gtk/init.lua
--- required by build/appmenu/src/cli.lua

local spawn = require("c3aea7c1-095b-4150-88c1-19fda04cc188.dep.src.agnostic.spawn")
local Promise = require("c3aea7c1-095b-4150-88c1-19fda04cc188.dep.src.util.Promise")

---@param command string
---@return Promise
local function spawn_promise (command)
    return Promise(function (res)
        spawn(command, res)
    end)
end

return spawn_promise