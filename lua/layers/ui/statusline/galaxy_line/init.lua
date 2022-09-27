return {
  'NTBBloodbath/galaxyline.nvim', -- https://neovimcraft.com/plugin/NTBBloodbath/galaxyline.nvim/index.html

  requires = { 'kyazdani42/nvim-web-devicons' },

  config = function()
    require('layers.ui.statusline.galaxy_line.config').config()
  end,
}
