--- required by build/appmenu/src/menu_provider/gtk/init.lua
--- required by build/appmenu/src/cli.lua

local spawn = require("0e720573-7213-4daa-b87b-0bd875ae02bb.dep.src.agnostic.spawn")
local Promise = require("0e720573-7213-4daa-b87b-0bd875ae02bb.dep.src.util.Promise")

---@param command string
---@return Promise
local function spawn_promise (command)
    return Promise(function (res)
        spawn(command, res)
    end)
end

return spawn_promise