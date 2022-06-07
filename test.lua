-- load lib
local ini = require "ini"

-- load & parse ini file
local ini_conf = ini.parse(ini.load("conf_test.ini"))

-- Test
print("global var")
print("name",     ini_conf["name"])
print("version",  ini_conf["version"])

print("\noptions")
print("speed",    ini_conf["options"]["speed"])
print("friction", ini_conf["options"]["friction"])

print("\nuserSettings")
print("width",    ini_conf["userSettings"]["width"])
print("height",   ini_conf["userSettings"]["height"])