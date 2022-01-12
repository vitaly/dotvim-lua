-- local diminactive = require 'mu.plugins.focus.diminactive'
local twilight = {
  'folke/twilight.nvim', -- https://github.com/folke/twilight.nvim

  config = function()
    require 'my.plugins.focus.twilight'
  end,
}

local zenmode = {
  'folke/zen-mode.nvim',
  config = function()
    require 'my.plugins.focus.zenmode'
  end,
}

return {
  twilight,
  zenmode,
}
