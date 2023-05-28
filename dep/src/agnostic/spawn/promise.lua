--- required by build/appmenu/src/menu_provider/gtk/init.lua
--- required by build/appmenu/src/cli.lua

local spawn = require("0f69ccdb-581a-4a4e-8d48-475e9cebc6ea.dep.src.agnostic.spawn")
local Promise = require("0f69ccdb-581a-4a4e-8d48-475e9cebc6ea.dep.src.util.Promise")

---@param command string
---@return Promise
local function spawn_promise (command)
    return Promise(function (res)
        spawn(command, res)
    end)
end

return spawn_promise