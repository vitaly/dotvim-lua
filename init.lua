-- print 'init.lua'

-- vim.lsp.set_log_level(0)

vim.g.my_vim_dir = vim.fn.expand '<sfile>:p:h'
vim.env.CC = 'gcc-11'

require 'init.tools'
require 'init.bootstrap'
require 'init.packer'

