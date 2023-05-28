--- required by build/appmenu/src/menu_provider/gtk/init.lua
--- required by build/appmenu/src/cli.lua

local spawn = require("9793106b-df92-41a0-a00d-28bc407b04e7.dep.src.agnostic.spawn")
local Promise = require("9793106b-df92-41a0-a00d-28bc407b04e7.dep.src.util.Promise")

---@param command string
---@return Promise
local function spawn_promise (command)
    return Promise(function (res)
        spawn(command, res)
    end)
end

return spawn_promise