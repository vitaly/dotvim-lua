return {
  {
    'nvim-telescope/telescope-fzf-native.nvim', -- https://github.com/nvim-telescope/telescope-fzf-native.nvim
    run = 'make',
  },
  {
    'nvim-telescope/telescope.nvim', -- https://github.com/nvim-telescope/telescope.nvim

    branch = '0.1.x',

    requires = {
      'nvim-lua/plenary.nvim',
      'nvim-telescope/telescope-fzf-native.nvim',
    },

    wants = {
      'nvim-web-devicons',
    },

    config = function()
      require('layers.fuzzy.config').setup()
    end,
  },
}
