--- required by build/appmenu/src/menu_provider/gtk/init.lua
--- required by build/appmenu/src/cli.lua

local spawn = require("f31759d0-79d2-47e6-8171-306bdcf3a135.dep.src.agnostic.spawn")
local Promise = require("f31759d0-79d2-47e6-8171-306bdcf3a135.dep.src.util.Promise")

---@param command string
---@return Promise
local function spawn_promise (command)
    return Promise(function (res)
        spawn(command, res)
    end)
end

return spawn_promise