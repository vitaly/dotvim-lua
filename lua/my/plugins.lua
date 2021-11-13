local plugins = require('my.packer.init')
local use = plugins.use
local plugin = plugins.plugin

use { 'wbthomason/packer.nvim', opt = true }
use { 'lewis6991/impatient.nvim' }
use { 'nvim-lua/plenary.nvim' }
use { 'svermeulen/vimpeccable' } -- https://github.com/svermeulen/vimpeccable
use { 'chriskempson/base16-vim' }
use { 'tpope/vim-surround' } -- https://github.com/tpope/vim-surround

plugin('my.plugins.which-key')
plugin('my.plugins.fuzzy')
plugin('my.plugins.lsp')
plugin('my.plugins.cmp')
plugin('my.plugins.tmux-navigator')
plugin('my.plugins.undo-tree')
plugin('my.plugins.treesitter')
plugin('my.plugins.neogen')
plugin('my.plugins.file-tree')
plugin('my.plugins.git')

puts 'my.plugins loaded'
return plugins
