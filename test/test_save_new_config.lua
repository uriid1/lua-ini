local ini = require('ini')

ini.save({
  server = {
    host = "127.0.0.1",
    port = 8080
  },
  log = {
    level = "debug"
  }
}, "test/config.ini")
