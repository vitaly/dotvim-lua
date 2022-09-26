-- print 'init.lua'

-- vim.o.verbose = 9
-- vim.o.verbosefile = './vim.log'

-- vim.lsp.set_log_level 'trace'
-- require('vim.lsp.log').set_format_func(vim.inspect)

_G.VERBOSE = false
vim.env.CC = 'gcc-11'

-- global utilities
require 'init.tools'

-- load custom config
require 'init.config'

_my.ROOT = vim.fn.expand '<sfile>:p:h' -- use fn.stdpath('config')?
vim.g.my_ROOT = _my.ROOT

-- 'impatient' is used to cache the compiled lua files
-- use `:LuaCacheClear` to clear the cache
_my.config.impatient = { profile = true }

-- disable unnecessary features
require 'init.builtins'

-- set vim options
require 'init.options'

-- install core packages, e.g. packer itself
require 'init.bootstrap'

-- initialize packer
require 'init.packer'
