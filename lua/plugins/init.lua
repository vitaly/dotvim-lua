require('packer').use {

  { 'wbthomason/packer.nvim', opt = true },

  {
    'lewis6991/impatient.nvim', -- https://github.com/lewis6991/impatient.nvim
  },

  {
    'nvim-lua/plenary.nvim', -- https://github.com/nvim-lua/plenary.nvim
  },

  {
    'folke/which-key.nvim', -- https://github.com/folke/which-key.nvim
  },

  {
    'nvim-telescope/telescope-fzf-native.nvim', -- https://github.com/nvim-telescope/telescope-fzf-native.nvim
    run = 'make',
  },

  {
    'nvim-telescope/telescope.nvim',
    requires = {
      'nvim-lua/popup.nvim',
      'nvim-lua/plenary.nvim',
      'telescope-fzf-native.nvim',
      'nvim-telescope/telescope-fzy-native.nvim',
      'nvim-telescope/telescope-symbols.nvim',
      'nvim-telescope/telescope-dap.nvim', -- https://github.com/nvim-telescope/telescope-dap.nvim
    },

    wants = {
      'popup.nvim',
      'plenary.nvim',
      'telescope-fzf-native.nvim',
    },

    config = function()
      -- require 'my.plugins.fuzzy.config'
    end,
  },

  {
    'chriskempson/base16-vim', -- https://github.com/chriskempson/base16-vim

    config = function()
      print('base16/config')
      -- vim.cmd [[source ~/.vimrc_background]]
    end,
  },

}
