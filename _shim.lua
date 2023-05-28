if not ... then
    error("this file must be require()'d")
end

local folder_of_this_file = (...):match("(.-)%.[^%.]+$") or ""

local function add_this_library()
    local uuid = "8ea8535f%-6950%-4d47%-9904%-c09f5ea7f92b"

    ---@param libraryname string
    table.insert(package.searchers, function(libraryname)
        if libraryname:match("^" .. uuid) then
            local resolved_path = libraryname:gsub(uuid, folder_of_this_file)

            -- this works because this searcher will always remove the uuid,
            -- therefore removing what triggered the searcher itself
            return function() return require(resolved_path) end
        end
    end)
end

add_this_library()
