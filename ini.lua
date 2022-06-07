--[[
    ####--------------------------------####
    #--# Author:   by uriid1            #--#
    #--# License:  GNU GPLv3            #--#
    #--# Telegram: @main_moderator      #--#
    #--# E-mail:   appdurov@gmail.com   #--#
    ####--------------------------------####
--]]

local M = {}

-- Type definition
local type_def = function(s)
    if s == nil then
        return nil
    end

    if type(s) == "string" then
        return s
    end
    
    return tonumber(s)
end

-- Load ini file
function M.load(fname)
    local file = io.open(fname)
    local rfile = file:read("*a")
    file:close()
    return rfile
end

-- Parse
function M.parse(str)

    local result = {}
    local section = nil

    for line in string.gmatch(str, "[^\n]+") do
        -- Find and add section
        local find_section = line:match("%[(%S+)%]")
        if find_section then
            if not result[line] then
                section = find_section
                result[section] = {}
            end
        end

        -- Add key = val
        local key, val = line:match("(%w+)%s+=%s+(.+)")
        if key then
            if section then
                result[section][key] = type_def(val)
            else
                result[key] = type_def(val)
            end
        end
    end

    return result
end

return M