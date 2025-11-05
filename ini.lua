--- INI file parser
--
-- @author uriid1
-- @license GNU GPLv3
-- @module ini

local ini = { _version = '1.2.2' }

local function convert(val)
  -- nil
  if val == nil then
    return nil
  end

  -- number
  local num = tonumber(val)
  if num then
    return num
  end

  -- boolean
  if val == 'true' then
    return true
  elseif val == 'false' then
    return false
  end

  -- Table
  if type(val) == 'table' then
    return val
  end

  -- string
  local str = tostring(val)
    :gsub('\'(.-)\'', '%1')
    :gsub('\"(.-)\"', '%1')

  return str
end

local function file_read(path)
  local fd = io.open(path, 'r')

  if not (io.type(fd) == 'file') then
    return nil
  end

  local data = fd:read('*a')
  fd:close()

  return data
end

-- Parse text-ini
local function parse(str)
  local data = {}
  local section

  for line in string.gmatch(str, '[^\n]+') do
    local comment = line:match('^[%#%;]')
    if comment then
      goto continue
    end

    -- Add section
    local find_section = line:match('^%[(.+)%]$')
    if find_section then
      -- Replace spaces
      find_section = find_section:gsub(' ', '_')

      if not data[line] then
        section = find_section
        data[section] = {}
      end
    end

    -- Add key = val
    local key, val = line:match('^(.-)%s*=%s*(.+)$')
    if key and val then
      -- Replace comment
      val = val:gsub('^(.+)%s*;.+$', '%1')

      local isArray = key:sub(-2) == '[]'
      if isArray then
        local arr = {}
        for value in string.gmatch(val, '[^,%s*]+') do
            table.insert(arr, convert(value))
        end

        key = key:sub(1, -3)
        val = arr
      end

      if section then
        data[section][key] = convert(val)
      else
        data[key] = convert(val)
      end
    end

    ::continue::
  end

  return data
end

--- Parse INI file and return table structure
-- @param file (string) Path to INI file
-- @return (table|nil) Parsed table or `nil` if file not found
-- @usage
-- local cfg = ini.parse("config.ini")
-- print(cfg.server.host, cfg.server.port)
function ini.parse(file)
  local data = file_read(file)

  if not data then
    return nil
  end

  return parse(data)
end

--- Save a Lua table into an INI file
-- Handles sections, arrays, and global variables
-- @param tbl (table) Data to write
-- @param path (string) Destination file path
-- @return (boolean) `true` on success, `false` on error
-- @usage
-- ini.save({
--   server = { host = "127.0.0.1", port = 8080 },
--   log = { level = "debug" }
-- }, "config.ini")
function ini.save(tbl, path)
  if type(tbl) ~= 'table' or type(path) ~= 'string' then
      return false
  end

  local global = '# Global var\n'
  local data = ''

  -- To text
  for key, val in pairs(tbl) do
    local section = tbl[key]

    if type(section) == 'table' then
      data = data .. ('\n[%s]'):format(key)

      for sectionKey, sectionValue in pairs(section) do
        -- Is array
        if type(sectionValue) == 'table' then
          local arr2str = table.concat(sectionValue, ', ')
          data = data .. ('\n%s = %s'):format(sectionKey, arr2str)
        else
          data = data .. ('\n%s = %s'):format(sectionKey, sectionValue)
        end
      end

      data = data .. '\n'
    else
      global = global .. ('%s = %s\n'):format(key, val)
    end
  end

  -- Save
  local fd = io.open(path, 'w')
  if not (io.type(fd) == 'file') then
    return false
  end

  fd:write(global .. data)
  fd:close()

  return true
end

return ini
