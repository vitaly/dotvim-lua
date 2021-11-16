local pinit = REQUIRE 'my.packer.init'
local use = pinit.use

local function plugin(name)
  REQUIRE(name)(use)
end

use { 'wbthomason/packer.nvim', opt = true }

use 'lewis6991/impatient.nvim'
use 'nvim-lua/plenary.nvim'
use 'svermeulen/vimpeccable'





plugin 'my.plugins.which-key'
plugin 'my.plugins.fuzzy'
plugin 'my.plugins.lsp'
plugin 'my.plugins.cmp'
plugin 'my.plugins.tmux-navigator'
plugin 'my.plugins.undo-tree'
plugin 'my.plugins.treesitter'
-- plugin('my.plugins.neogen')
plugin 'my.plugins.file-tree'
plugin 'my.plugins.git'
plugin 'my.plugins.comments'
plugin 'my.plugins.zoom'
plugin 'my.plugins.statusline'
plugin 'my.plugins.tags'
plugin 'my.plugins.blankline'
plugin 'my.plugins.diminactive'
plugin 'my.plugins.words'
plugin 'my.plugins.misc'




-- puts 'my.plugins loaded'
return pinit
