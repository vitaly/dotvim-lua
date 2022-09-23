-- print 'init.lua'

-- vim.lsp.set_log_level(0)

vim.env.CC = 'gcc-11'
_G._my = _G._my or {}

_my.ROOT = vim.fn.expand '<sfile>:p:h' -- use fn.stdpath('config')?
vim.g.my_ROOT = _my.ROOT

_my.config = _my.config or {}

-- 'impatient' is used to cache the compiled lua files
-- use `:LuaCacheClear` to clear the cache
_my.config.profile_impatient = true

require 'init.builtins' -- disable unnecessary features
require 'init.options'
require 'init.tools'
require 'init.bootstrap'
require 'init.packer'
