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
    -- nil
    if s == nil then
        return nil
    end

    -- number
    local num = tonumber(s)
    if num then
        return num
    end

    -- boolean
    if s == "true" then
        return true
    elseif s == "false" then
        return false
    end

    -- string
    return s
end

-- Load ini text file
function M.load(fname)
    local file = io.open(fname)
    local rfile = file:read("*a")
    file:close()
    return rfile
end

-- Parse ini text
function M.parse(str)

    local result   = {}
    local section  = nil

    for line in string.gmatch(str, "[^\n]+") do
        -- Find and add section
        local find_section = line:match("^%[(%S+)%]$")
        if find_section then
            if not result[line] then
                section = find_section
                result[section] = {}
            end
        end

        -- Comments
        -- local tmp_comment = line:match("^;(.+)$") or line:match("^#(.+)$")
        -- if tmp_comment then
        -- end

        -- Add key = val
        local key, val = line:match("^(%w+)%s+=%s+(.+)$")
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

-- Load and parse
function M.loadParse(fname)
    return M.parse(M.load(fname))
end

-- Save ini
function M.save(tbl, fname)
    local global = "; Global var\n"
    local default = ""

    -- Parse
    for k, v in pairs(tbl) do
        if type(tbl[k]) == "table" then
            default = default .. ("\n[%s]"):format(k)
            for k1, v1 in pairs(tbl[k]) do
                default = default .. ("\n%s = %s"):format(k1, v1)
            end

            default = default .. "\n"
        else
            global = global .. ("%s = %s\n"):format(k, v)
        end
    end

    -- Save
    local file = io.open(fname, "w")
    file:write(global .. default)
    file:close()
    
    return true
end

return M