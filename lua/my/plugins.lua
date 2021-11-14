local pinit = REQUIRE('my.packer.init')
local use = pinit.use

local function plugin(name)
  REQUIRE(name)(use)
end

use { 'wbthomason/packer.nvim', opt = true }

use 'lewis6991/impatient.nvim'
use 'nvim-lua/plenary.nvim'
use 'svermeulen/vimpeccable'        -- https://github.com/svermeulen/vimpeccable
use 'chriskempson/base16-vim'
use 'tpope/vim-repeat'              -- '.' replacement with support for plugins
use 'tpope/vim-surround'            -- https://github.com/tpope/vim-surround
use 'editorconfig/editorconfig-vim'

use {
  'lfv89/vim-interestingwords',
  setup = function ()
    vim.g.interestingWordsGUIColors = { '#ff0000', '#00ff00', '#0000ff', '#ffff00', '#00ffff', '#ff00ff', '#888888', '#880000', '#008800', '#000088', '#888800', '#008888', '#880088', '#8800ff', '#88aaff', '#ff8800', '#ff4488', '#ffffff' }
    -- vim.g.interestingWordsRandomiseColors = 1
  end
}

use {
  'junegunn/vim-easy-align', -- https://github.com/junegunn/vim-easy-align
  config = function()
    xmap('<Enter>', '<Plug>(LiveEasyAlign)')
  end
}

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
plugin('my.plugins.zoom')

-- puts 'my.plugins loaded'
return pinit
