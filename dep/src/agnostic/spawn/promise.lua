--- required by build/appmenu/src/menu_provider/gtk/init.lua
--- required by build/appmenu/src/cli.lua

local spawn = require("73b08e77-9523-460d-a24a-9739f3229cce.dep.src.agnostic.spawn")
local Promise = require("73b08e77-9523-460d-a24a-9739f3229cce.dep.src.util.Promise")

---@param command string
---@return Promise
local function spawn_promise (command)
    return Promise(function (res)
        spawn(command, res)
    end)
end

return spawn_promise