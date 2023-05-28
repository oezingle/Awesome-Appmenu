--- required by build/appmenu/src/menu_provider/gtk/init.lua
--- required by build/appmenu/src/cli.lua

local spawn = require("6988790a-3167-4de7-93c3-c29651a262e8.dep.src.agnostic.spawn")
local Promise = require("6988790a-3167-4de7-93c3-c29651a262e8.dep.src.util.Promise")

---@param command string
---@return Promise
local function spawn_promise (command)
    return Promise(function (res)
        spawn(command, res)
    end)
end

return spawn_promise