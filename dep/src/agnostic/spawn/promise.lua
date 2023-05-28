--- required by build/appmenu/src/menu_provider/gtk/init.lua
--- required by build/appmenu/src/cli.lua

local spawn = require("6c6bb20a-bfed-47e3-8066-4852e63145a1.dep.src.agnostic.spawn")
local Promise = require("6c6bb20a-bfed-47e3-8066-4852e63145a1.dep.src.util.Promise")

---@param command string
---@return Promise
local function spawn_promise (command)
    return Promise(function (res)
        spawn(command, res)
    end)
end

return spawn_promise