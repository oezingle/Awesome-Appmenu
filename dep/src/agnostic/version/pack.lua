--- required by build/appmenu/dep/src/util/lgi/dbus.lua
--- required by build/appmenu/dep/src/util/Promise.lua

local pack = table.pack or function (...)
    local tmp = {...}
    tmp.n = select("#", ...)

    return tmp
end

return pack