-- load lib
local ini = require 'ini'

-- load & parse ini file.
local conf = ini.parse 'test.ini'

local global = {}

-- All print
for sectionName, _ in pairs(conf) do
    if type(conf[sectionName]) == 'table' then
        print('['..sectionName..']')

        for key, val in pairs(conf[sectionName]) do
            print(key, val, type(val))
        end
        print('\n')
    else
        global[sectionName] = conf[sectionName]
    end
end

-- Global print
print('# Global')
for sectionName, value in pairs(global) do
    print(sectionName, value)
end