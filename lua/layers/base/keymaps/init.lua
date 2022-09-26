-- lua/layers/base/keymaps/init.lua

-- TODO: finish commented parts
return {
  {
    'b0o/mapx.nvim', -- https://github.com/b0o/mapx.nvim
  },
  {
    'folke/which-key.nvim', -- https://github.com/folke/which-key.nvim

    config = function()
      require('layers.base.keymaps.config').setup()
      require('layers.base.keymaps.maps').setup()
    end,
  },
}
