-- return {
--   {
--     'nvim-telescope/telescope-fzf-native.nvim', -- https://github.com/nvim-telescope/telescope-fzf-native.nvim
--     run = 'make',
--   },
  return {
    'nvim-telescope/telescope.nvim', -- https://github.com/nvim-telescope/telescope.nvim

    requires = {
      'nvim-lua/plenary.nvim',
    },

    after = 'keymaps',

    config = function()
      require 'layers.fuzzy.config'
    end,
  -- },

}
