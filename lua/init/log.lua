--------------------------------------------------------------------------------
--- LOGGING

-- vim.o.verbose = 9
-- vim.o.verbosefile = './vim.log'

-- vim.lsp.set_log_level 'trace'
-- require('vim.lsp.log').set_format_func(vim.inspect)

-- 'inspect' all provided arguments using ',' as separator
function my.inspect(...)
  local objects = {}

  for i, v in ipairs({ ... }) do
    objects[i] = type(v) == 'string' and v or vim.inspect(v)
  end

  return table.concat(objects, ', ')
end

-- generic logging function
local notify = vim.schedule_wrap(function(level, ...)
  local log_level = require('onion.config').get('log_level')
  if level >= log_level then vim.notify(my.inspect(...), level) end
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
