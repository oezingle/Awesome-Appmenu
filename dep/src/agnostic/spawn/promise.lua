--- required by build/appmenu/src/menu_provider/gtk/init.lua
--- required by build/appmenu/src/cli.lua

local spawn = require("d8f35b55-0b0f-41bf-8968-849b9a00e323.dep.src.agnostic.spawn")
local Promise = require("d8f35b55-0b0f-41bf-8968-849b9a00e323.dep.src.util.Promise")

---@param command string
---@return Promise
local function spawn_promise (command)
    return Promise(function (res)
        spawn(command, res)
    end)
end

return spawn_promise