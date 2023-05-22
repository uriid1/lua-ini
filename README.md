## Info
Simple and small library for your ini.</br>
Support for load and saving ini files.</br>
Warning: there is no support for load and save comments. Because it doesn't make sense.

## File format
```ini
; One line comment
# Unix style comment

; Global var
programName = "Cool Game"
__version = 1.1

; Comment
[section_name]
speed = 100     ; Game speed
gravity = 0.1   # Game gravity

[all_types_TEST]
var_int = 123
var_float = 1.23
var_bool = true
var_arr[] = 1, 2, 3, 4, 5
var_arr_fruits[] = apple, banana, orange
var_arr_mutate[] = 1, banana, 2, orange
```

## Usage example
```lua
local ini = require 'ini'
local conf = ini.parse 'conf_test.ini'

-- Test
print(conf.__verion)
print(conf.section_name.speed)
print(conf.section_name.gravity)
```