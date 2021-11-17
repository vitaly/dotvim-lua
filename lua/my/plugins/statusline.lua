return function(use)
  use {
    'NTBBloodbath/galaxyline.nvim',
    -- your statusline
    config = function()
      require 'galaxyline.themes.eviline'
      -- require 'galaxyline.themes.neonline'
      -- require 'galaxyline.themes.spaceline'
    end,
    -- some optional icons
    requires = { 'kyazdani42/nvim-web-devicons' },
  }

  -- use {
  --   'nvim-lualine/lualine.nvim', -- https://github.com/nvim-lualine/lualine.nvim
  --   requires = { 'kyazdani42/nvim-web-devicons' },

  --   config = function()
  --     require('lualine').setup {
  --       options = {
  --         -- theme = vim.g.colors_name or 'auto',
  --       },
  --     }
  --   end,
  -- }
end
