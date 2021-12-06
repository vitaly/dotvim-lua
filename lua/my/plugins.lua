local pinit = REQUIRE 'my.packer.init'
local use = pinit.use

local function plugin(name)
  use(REQUIRE('my.plugins.' .. name))
end

use { 'wbthomason/packer.nvim', opt = true }

use 'lewis6991/impatient.nvim'
use 'nvim-lua/plenary.nvim'
use 'svermeulen/vimpeccable'

plugin 'which-key'
plugin 'fuzzy'
plugin 'lsp'
plugin 'cmp'
plugin 'tmux-navigator'
plugin 'undo-tree'
plugin 'treesitter'
plugin 'languages'
plugin 'file-tree'
plugin 'git'
plugin 'comments'
plugin 'zoom'
plugin 'statusline'
plugin 'tags'
plugin 'blankline'
plugin 'diminactive'
plugin 'words'
plugin 'misc'
plugin 'neorg'
plugin 'autoformat'
plugin 'debug'
-- plugin 'neogen'

-- puts 'my.plugins loaded'
return pinit
