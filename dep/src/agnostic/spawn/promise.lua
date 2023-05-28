--- required by build/appmenu/src/menu_provider/gtk/init.lua
--- required by build/appmenu/src/cli.lua

local spawn = require("03c9e770-baa2-402b-afa3-29d14e6fdf64.dep.src.agnostic.spawn")
local Promise = require("03c9e770-baa2-402b-afa3-29d14e6fdf64.dep.src.util.Promise")

---@param command string
---@return Promise
local function spawn_promise (command)
    return Promise(function (res)
        spawn(command, res)
    end)
end

return spawn_promise