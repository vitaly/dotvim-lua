-- print 'init.lua'

-- vim.lsp.set_log_level(0)

vim.env.CC = 'gcc-11'
_G._my = _G._my or {}

_my.ROOT = vim.fn.expand '<sfile>:p:h'
vim.g.my_ROOT = _my.ROOT

require 'init.builtins' -- disable unnecessary features
require 'init.options'
require 'init.tools'
require 'init.bootstrap'
require 'init.packer'
