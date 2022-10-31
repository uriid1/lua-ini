## Info
Very simple and small library for your ini.
Support for load and saving ini files.
Warning: there is no support for load and save comments. Because it doesn't make sense.

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
local ini = require("ini")

-- load & parse ini file
local conf = ini.parse("conf_test.ini")

-- Test
print("global var")
print("name",     conf["name"])
print("version",  conf["version"])

print("\noptions")
print("speed",    conf["options"]["speed"])
print("friction", conf["options"]["friction"])

print("\nuserSettings")
print("width",    conf["userSettings"]["width"])
print("height",   conf["userSettings"]["height"])
```