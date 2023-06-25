_G.my = _G.my or {}
my.root = vim.uv.fs_realpath(vim.fn.stdpath 'config')
vim.g.MY_ROOT = my.root

require 'init.options'
require 'init.log'
require 'init.lazy'
