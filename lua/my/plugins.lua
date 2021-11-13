local plugins = require('my.packer.init')
local use = plugins.use
local plugin = plugins.plugin

use { 'wbthomason/packer.nvim', opt = true }
use { 'lewis6991/impatient.nvim' }
use { 'nvim-lua/plenary.nvim' }
-- https://github.com/svermeulen/vimpeccable
use { 'svermeulen/vimpeccable' }

plugin('my.plugins.which-key')
plugin('my.plugins.fuzzy')
plugin('my.plugins.lsp')
plugin('my.plugins.cmp')

puts 'my.plugins loaded'

return plugins
