--- required by build/appmenu/src/widget/menu.lua
--- required by build/appmenu/src/widget/button/init.lua
--- required by build/appmenu/src/menu_provider/gtk/item.lua
--- required by build/appmenu/src/menu_provider/fake.lua
--- required by build/appmenu/src/menu_provider/divider.lua
--- required by build/appmenu/src/menu_provider/canonical/item.lua
--- required by build/appmenu/dep/src/util/lgi/dbus.lua
--- required by build/appmenu/src/menu_provider/base.lua
--- required by build/appmenu/dep/src/util/Promise.lua
local class = require("0e720573-7213-4daa-b87b-0bd875ae02bb.dep.lib.30log.30log")

-- hehe
if false then
    --[[
    --- Create a class
    ---@generic T
    ---@param name string the name of the class
    ---@param properties T properties for the class - not instances!
    ---@return T class the bound class object. use :init(), not :new()
    class = function(name, properties)
        return class(name, properties)
    end

    --- Create a class
    ---@param name string the name of the class
    class = function(name)

    end
    ]]

    ---@generic T
    -- ---@alias LogClassExtender<B> (fun(self: LogClass, name: string, properties: T): (LogClass<T>|B))|(fun(self: LogClass, name: string): (LogClass<table>|B))
    ---@alias Log.ClassExtender (fun(self: LogClass, name: string, properties: T): LogClass<T>)|(fun(self: LogClass, name: string): LogClass<table>)

    ---@class Log.BaseFunctions
    ---@field public init fun(self: LogClass, ...: any) abstract function to initialize the class. return value ignored
    ---@field public new function interally used by 30log. do not modify
    ---@field instanceOf fun(self: LogClass, class: Log.BaseFunctions): boolean check if an object is an instance of a class
    -- TODO :cast
    ---@field classOf fun(self: LogClass, possibleSubClass: any): boolean check if a given object is a subclass of this class
    ---@field subclassOf fun(self: LogClass, possibleParentClass: any): boolean check if a given object is this class's parent class
    ---@field subclasses fun(self: LogClass): LogClass[]
    ---@field extend Log.ClassExtender
    ---@field super LogClass?
    -- TODO https://github.com/Yonaba/30log/wiki/Mixins

    ---@alias LogClass<T> Log.BaseFunctions | { extend: Log.ClassExtender<T> } | T

    ---@generic T
    ---@type (fun(name: string, properties: T): LogClass<T>)|(fun(name: string): LogClass<table>)
    class = function (name, properties)
        return class(name, properties)
    end
end

return class