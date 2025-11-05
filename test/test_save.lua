local ini = require 'ini'

local tbl = {
  -- Global var
  name = 'Cool Game';
  version = '1.0.1';

  -- Program options
  options = {
    start = true;
    speed = 100;
    friction = 0.1;
  };

  -- Custom user settings
  userSettings = {
    width  = 640;
    height = 480;
  };

  -- Array
  testArray = {
    numbers = {1, 2, 3, 4, 5};
    fruits = {'apple', 'banana', 'orange'}
  }
}

ini.save(tbl, 'foo_foo.ini')
