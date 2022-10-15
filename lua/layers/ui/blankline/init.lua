-- lua/layers/ui/blankline.lua

return {
  'lukas-reineke/indent-blankline.nvim', -- https://github.com/lukas-reineke/indent-blankline.nvim

  after = {
    'nvim-base16',
  },
  config = function()
    require('layers.ui.blankline.config').config()
  end,
}
