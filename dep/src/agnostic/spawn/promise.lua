--- required by build/appmenu/src/menu_provider/gtk/init.lua
--- required by build/appmenu/src/cli.lua

local spawn = require("fd5d405c-8daf-49cc-b809-0665a9d3b1f7.dep.src.agnostic.spawn")
local Promise = require("fd5d405c-8daf-49cc-b809-0665a9d3b1f7.dep.src.util.Promise")

---@param command string
---@return Promise
local function spawn_promise (command)
    return Promise(function (res)
        spawn(command, res)
    end)
end

return spawn_promise