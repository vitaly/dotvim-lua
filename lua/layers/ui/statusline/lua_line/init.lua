return {
  'nvim-lualine/lualine.nvim', -- https://github.com/nvim-lualine/lualine.nvim
  requires = { 'kyazdani42/nvim-web-devicons' },

  config = function()
    require('layers.ui.statusline.lua_line.config').setup()
  end,
}
