--- required by build/appmenu/src/menu_provider/gtk/init.lua
--- required by build/appmenu/src/cli.lua

local spawn = require("c1a7b0b2-8d53-4d76-9f91-337bcec5604b.dep.src.agnostic.spawn")
local Promise = require("c1a7b0b2-8d53-4d76-9f91-337bcec5604b.dep.src.util.Promise")

---@param command string
---@return Promise
local function spawn_promise (command)
    return Promise(function (res)
        spawn(command, res)
    end)
end

return spawn_promise