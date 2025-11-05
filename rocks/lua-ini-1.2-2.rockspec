package = "lua-ini"
version = "1.2-2"
source = {
  url = "git+https://github.com/uriid1/lua-ini.git",
  tag = "v1.2.2"
}
description = {
  summary = "Simple and small library for your ini",
  detailed = [[
    lua-ini is a simple Lua library for parsing INI files. Support for load and saving ini files.
  ]],
  homepage = "https://github.com/uriid1/lua-ini",
  license = "AGPL"
}
dependencies = {
  "lua >= 5.1"
}
build = {
  type = "builtin",
  modules = {
    ini = "ini.lua"
  }
}
