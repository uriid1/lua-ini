-- load lib
local ini = require "ini"

-- load & parse ini file
local ini_conf = ini.parse(ini.load("conf_test.ini"))

-- Test
print("global var")
print("name",     ini_conf["name"],    type(ini_conf["name"]))
print("version",  ini_conf["version"], type(ini_conf["version"]))

print("\noptions")
print("start",    ini_conf["options"]["start"],    type(ini_conf["options"]["start"]))
print("speed",    ini_conf["options"]["speed"],    type(ini_conf["options"]["speed"]))
print("friction", ini_conf["options"]["friction"], type(ini_conf["options"]["friction"]))

print("\nuserSettings")
print("width",    ini_conf["userSettings"]["width"],  type(ini_conf["userSettings"]["width"]))
print("height",   ini_conf["userSettings"]["height"], type(ini_conf["userSettings"]["height"]))