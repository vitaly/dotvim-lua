-- lua/layers/telescope/init.lua

return {
  'nvim-telescope/telescope.nvim', -- https://github.com/nvim-telescope/telescope.nvim

  branch = '0.1.x',

  requires = {
    'nvim-lua/plenary.nvim',
    {
      'nvim-telescope/telescope-fzf-native.nvim', -- https://github.com/nvim-telescope/telescope-fzf-native.nvim
      run = 'make',
    },
    'nvim-telescope/telescope-symbols.nvim',
    -- 'nvim-telescope/telescope-dap.nvim', -- https://github.com/nvim-telescope/telescope-dap.nvim
  },

  wants = {
    'nvim-web-devicons',
  },

  config = function()
    require('layers.telescope.config').setup()
  end,
}
