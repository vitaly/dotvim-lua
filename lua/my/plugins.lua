local pinit = REQUIRE 'my.packer.init'
local use = pinit.use

local function plugin(name)
  REQUIRE(name)(use)
end

use { 'wbthomason/packer.nvim', opt = true }

use 'lewis6991/impatient.nvim'
use 'nvim-lua/plenary.nvim'
use 'svermeulen/vimpeccable'
use 'chriskempson/base16-vim'
use 'tpope/vim-repeat'
use 'tpope/vim-surround'
use 'editorconfig/editorconfig-vim'
use {
  'github/copilot.vim',
  setup = function()
    vim.g.copilot_no_tab_map = 1
    vim.g.copilot_assume_mapped = 1
    imap({ 'nowait', 'expr' }, '<C-Space>', [[copilot#Accept('')]])
  end,
}

use {
  'lfv89/vim-interestingwords',
  setup = function()
    vim.g.interestingWordsGUIColors = {
      '#ff0000',
      '#00ff00',
      '#0000ff',
      '#ffff00',
      '#00ffff',
      '#ff00ff',
      '#888888',
      '#880000',
      '#008800',
      '#000088',
      '#888800',
      '#008888',
      '#880088',
      '#8800ff',
      '#88aaff',
      '#ff8800',
      '#ff4488',
      '#ffffff',
    }
    -- vim.g.interestingWordsRandomiseColors = 1
  end,
}

use {
  'junegunn/vim-easy-align', -- https://github.com/junegunn/vim-easy-align
  config = function()
    xmap('<Enter>', '<Plug>(LiveEasyAlign)')
  end,
}

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

use {
  'blueyed/vim-diminactive', -- https://github.com/blueyed/vim-diminactive

  setup = function()
    vim.g.diminactive_use_colorcolumn = 1
    vim.g.diminactive_use_syntax = 0
  end,

  config = function()
    noremap('<plug>Toggle(diminactive)', function()
      vim.cmd [[DimInactiveToggle]]
    end)

    nmap('<leader>Td', '<plug>Toggle(diminactive)')
  end,
}

use {
  'norcalli/nvim-colorizer.lua', -- https://github.com/norcalli/nvim-colorizer.lua
  config = function()
    require('colorizer').setup()
  end,
}

use {
  'lukas-reineke/indent-blankline.nvim', -- https://github.com/lukas-reineke/indent-blankline.nvim
  config = function()
    vim.cmd [[highlight IndentBlanklineIndent1 guifg=#E06C75 gui=nocombine]]
    vim.cmd [[highlight IndentBlanklineIndent2 guifg=#E5C07B gui=nocombine]]
    vim.cmd [[highlight IndentBlanklineIndent3 guifg=#98C379 gui=nocombine]]
    vim.cmd [[highlight IndentBlanklineIndent4 guifg=#56B6C2 gui=nocombine]]
    vim.cmd [[highlight IndentBlanklineIndent5 guifg=#61AFEF gui=nocombine]]
    vim.cmd [[highlight IndentBlanklineIndent6 guifg=#C678DD gui=nocombine]]
    require('indent_blankline').setup {
      char = '▏',
      use_treesitter = true,
      -- space_char_blankline = " ",
      show_current_context = true,
      show_current_context_start = true,

      char_highlight_list = {
        'IndentBlanklineIndent1',
        'IndentBlanklineIndent2',
        'IndentBlanklineIndent3',
        'IndentBlanklineIndent4',
        'IndentBlanklineIndent5',
        'IndentBlanklineIndent6',
      },
    }
  end,
}

-- puts 'my.plugins loaded'
return pinit
