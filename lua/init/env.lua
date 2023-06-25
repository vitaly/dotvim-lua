-- vim.o.verbose = 9
-- vim.o.verbosefile = './vim.log'

-- vim.lsp.set_log_level 'trace'
-- require('vim.lsp.log').set_format_func(vim.inspect)

vim.env.CC = 'gcc-12'
_G.my = _G.my or {}

my.ROOT = vim.uv.fs_realpath(vim.fn.stdpath 'config')
vim.g.MY_ROOT = my.ROOT
