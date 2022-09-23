-- return {
--   'NTBBloodbath/galaxyline.nvim',
--   -- your statusline
--   config = function()
--     REQUIRE 'my.plugins.statusline.config'
--   end,
--   -- some optional icons
--   requires = { 'kyazdani42/nvim-web-devicons' },
-- }

return {
  'nvim-lualine/lualine.nvim', -- https://github.com/nvim-lualine/lualine.nvim
  requires = { 'kyazdani42/nvim-web-devicons' },

  config = function()
    require('layers.ui.statusline.config').setup()
  end,
}
