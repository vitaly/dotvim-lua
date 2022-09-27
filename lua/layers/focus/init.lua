-- lua/layers/focus/init.lua

return {
  {
    'folke/twilight.nvim', -- https://github.com/folke/twilight.nvim

    config = function()
      require('layers.focus.twilight-config').config()
    end,
  },
  {
    'folke/zen-mode.nvim', -- https://github.com/folke/zen-mode.nvim

    config = function()
      require('layers.focus.zenmode-config').config()
    end,
  },
}
