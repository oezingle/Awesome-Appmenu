
local folder_of_this_file

-- https://stackoverflow.com/questions/4521085/main-function-in-lua
if pcall(debug.getlocal, 4, 1) then
    folder_of_this_file = (...):match("(.-)[^%.]+$")
else
    folder_of_this_file = arg[0]:gsub("[^%./\\]+%..+$", ""):gsub("[/\\]", ".")
end

require(folder_of_this_file .. "_shim")

-- TODO @path
return require("e5cdbf3b-be78-4d9e-a1e4-b7d62346b438.src.widget")