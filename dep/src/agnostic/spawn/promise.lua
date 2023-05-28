--- required by build/appmenu/src/menu_provider/gtk/init.lua
--- required by build/appmenu/src/cli.lua

local spawn = require("ed44928a-2b09-4f7b-afc8-62d7935b5f23.dep.src.agnostic.spawn")
local Promise = require("ed44928a-2b09-4f7b-afc8-62d7935b5f23.dep.src.util.Promise")

---@param command string
---@return Promise
local function spawn_promise (command)
    return Promise(function (res)
        spawn(command, res)
    end)
end

return spawn_promise