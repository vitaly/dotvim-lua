return {
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
      require 'my.plugins.fuzzy.config'
    end,
  },
}
