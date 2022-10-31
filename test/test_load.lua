-- load lib
local ini = require("ini")

-- load & parse ini file.
-- ini.parse(path_to_file)
local ini_conf = ini.parse("conf_test.ini")
-- or
-- local ini_conf = ini.loadParse("conf_test.ini")

-- Test
print(("name: %s | %s"):format(ini_conf["name"], type(ini_conf["name"])))
print(("version: %s | %s"):format(ini_conf["version"], type(ini_conf["version"])))

for tbl_name,_ in pairs(ini_conf) do
    if type(ini_conf[tbl_name]) == "table" then
        print('\n['..tbl_name..']')
        for key, val in pairs(ini_conf[tbl_name]) do
            print(("%s: %s | %s"):format(key, val, type(val)))
        end
    end
end

-- or
-- print("\n[options]")
-- print("start",    ini_conf["options"]["start"],    type(ini_conf["options"]["start"]))
-- print("speed",    ini_conf["options"]["speed"],    type(ini_conf["options"]["speed"]))
-- print("friction", ini_conf["options"]["friction"], type(ini_conf["options"]["friction"]))

-- print("\n[userSettings]")
-- print("width",    ini_conf["userSettings"]["width"],  type(ini_conf["userSettings"]["width"]))
-- print("height",   ini_conf["userSettings"]["height"], type(ini_conf["userSettings"]["height"]))