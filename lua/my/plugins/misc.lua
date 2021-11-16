return function(use)
  use 'chriskempson/base16-vim'
  use 'tpope/vim-repeat'
  use 'tpope/vim-surround'
  use 'editorconfig/editorconfig-vim'
  use {
    'norcalli/nvim-colorizer.lua', -- https://github.com/norcalli/nvim-colorizer.lua
    config = function()
      require('colorizer').setup()
    end,
  }
  use {
    'github/copilot.vim',
    setup = function()
      vim.g.copilot_no_tab_map = 1
      vim.g.copilot_assume_mapped = 1
      imap({ 'nowait', 'expr' }, '<C-Space>', [[copilot#Accept('')]])
    end,
  }

  use {
    'junegunn/vim-easy-align', -- https://github.com/junegunn/vim-easy-align
    config = function()
      xmap('<Enter>', '<Plug>(LiveEasyAlign)')
    end,
  }
end
