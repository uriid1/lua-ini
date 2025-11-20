# lua-ini

Support for load and saving ini files.

---

> [!warning]
> There is no support for load and save comments. Because it doesn't make sense.

# Format
```ini
; One line comment
# Unix style comment

; Global var
test = "Hello, World!"
__version = 1.1

# Environment variable
lang = ${LANG}
user = ${USER}

; Comment
[section_name]
speed = 100     ; Game speed
gravity = 0.1   # Game gravity

[types]
var_int = 123
var_float = 1.23
var_bool = true
var_char = 'A'
var_string = "Awesome ini!"
var_arr[] = 1, 2, 3, 4, 5
var_arr_fruits[] = apple, banana, orange
var_arr_mutate[] = 1, banana, 2, orange
```

# Example
```lua
local ini = require 'ini'
local conf = ini.parse 'test/conf_test.ini'

-- Test
print(conf.__verion)
print(conf.section_name.speed)
print(conf.section_name.gravity)
```
