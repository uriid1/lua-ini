-- load lib
local ini = require 'ini'

-- load & parse ini file
local conf = ini.parse 'test/test_env.ini'

require('pimp')(conf)
