--------------------------------------------------------------------------------
--- LOGGING

-- vim.o.verbose = 9
-- vim.o.verbosefile = './vim.log'

-- vim.lsp.set_log_level 'trace'
-- require('vim.lsp.log').set_format_func(vim.inspect)

-- Default log level before onion.config is loaded
local DEFAULT_LOG_LEVEL = vim.log.levels.WARN

-- 'inspect' all provided arguments using ',' as separator
function my.inspect(...)
  local objects = {}

  for i, v in ipairs({ ... }) do
    objects[i] = type(v) == 'string' and v or vim.inspect(v)
  end

  return table.concat(objects, ', ')
end

--- Get the current log level, with fallback if onion.config is not loaded yet
---@return integer
local function get_log_level()
  local ok, onion_config = pcall(require, 'onion.config')
  if ok and onion_config then
    return onion_config.get('log_level') or DEFAULT_LOG_LEVEL
  end
  return DEFAULT_LOG_LEVEL
end

-- generic logging function
local notify = vim.schedule_wrap(function(level, ...)
  if level >= get_log_level() then vim.notify(my.inspect(...), level) end
end)

my.log = {
  notify = notify,

  trace = function(...) notify(vim.log.levels.TRACE, ...) end,

  debug = function(...) notify(vim.log.levels.DEBUG, ...) end,

  info = function(...) notify(vim.log.levels.INFO, ...) end,

  warn = function(...) notify(vim.log.levels.WARN, ...) end,

  error = function(...) notify(vim.log.levels.ERROR, ...) end,
}

_G.PRINT = my.log.debug
