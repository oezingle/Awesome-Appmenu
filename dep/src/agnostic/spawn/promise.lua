--- required by build/appmenu/src/menu_provider/gtk/init.lua
--- required by build/appmenu/src/cli.lua

local spawn = require("682ee8d0-7e5d-4188-8d1d-853a7e7ef3ee.dep.src.agnostic.spawn")
local Promise = require("682ee8d0-7e5d-4188-8d1d-853a7e7ef3ee.dep.src.util.Promise")

---@param command string
---@return Promise
local function spawn_promise (command)
    return Promise(function (res)
        spawn(command, res)
    end)
end

return spawn_promise