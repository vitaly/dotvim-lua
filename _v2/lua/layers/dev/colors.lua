return {
  {
    'nvim-colortils/colortils.nvim', -- https://github.com/nvim-colortils/colortils.nvim

    -- cmd = 'Colortils',

    config = function()
      require('colortils').setup()
    end,
  },
  {
    'ziontee113/color-picker.nvim', -- https://github.com/ziontee113/color-picker.nvim

    cmd = { 'PickColor', 'PickColorInsert' },

    config = function()
      require 'color-picker'
    end,
  },
}
