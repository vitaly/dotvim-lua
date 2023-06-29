--------------------------------------------------------------------------------
--- LOGGING

-- vim.o.verbose = 9
-- vim.o.verbosefile = './vim.log'

-- vim.lsp.set_log_level 'trace'
-- require('vim.lsp.log').set_format_func(vim.inspect)

-- '_inspect' requires a delimiter and inspects all provided arguments.
function my._inspect(delimiter, ...)
  local objects = {}

  for i, v in ipairs { ... } do
    objects[i] = type(v) == 'string' and v or vim.inspect(v)
  end

  return table.concat(objects, delimiter)
end

-- 'inspect' uses a default delimiter (', ') and inspects all provided arguments.
function my.inspect(...)
  return my._inspect(', ', ...)
end

-- generic logging function
local _notify = vim.schedule_wrap(function(level, ...)
  if level >= my.log.level then
    vim.notify(my.inspect(...), level)
  end
end)

my.log = {

  trace = function(...)
    _notify(vim.log.levels.TRACE, ...)
  end,

  debug = function(...)
    _notify(vim.log.levels.DEBUG, ...)
  end,

  info = function(...)
    _notify(vim.log.levels.INFO, ...)
  end,

  warn = function(...)
    _notify(vim.log.levels.WARN, ...)
  end,

  error = function(...)
    _notify(vim.log.levels.ERROR, ...)
  end,
}

-- TODO: add a toggle to go through info, debug, trace
my.log.level = my.log.level or my.config.log.level or vim.log.levels.INFO
