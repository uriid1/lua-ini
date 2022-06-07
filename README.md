## Info
Very simple and small library for your ini files.

## Ini exepmle
```ini
; Global var
name = Cool Game
version = 1.0.1

; Program options
[options]
speed = 100
friction = 0.1

; Custom user settings
[userSettings]
width  = 640
height = 480
```

## Use
```lua
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
```