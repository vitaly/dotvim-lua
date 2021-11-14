---@diagnostic disable-next-line: different-requires
local packer_init = require('my.packer.init')
local use = packer_init.use
local plugin = packer_init.plugin

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
plugin('my.plugins.comments')

puts 'my.plugins loaded'
return packer_init
