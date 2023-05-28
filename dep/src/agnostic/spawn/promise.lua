--- required by build/appmenu/src/menu_provider/gtk/init.lua
--- required by build/appmenu/src/cli.lua

local spawn = require("b4b8790a-35d0-429d-b907-58371e9ded29.dep.src.agnostic.spawn")
local Promise = require("b4b8790a-35d0-429d-b907-58371e9ded29.dep.src.util.Promise")

---@param command string
---@return Promise
local function spawn_promise (command)
    return Promise(function (res)
        spawn(command, res)
    end)
end

return spawn_promise