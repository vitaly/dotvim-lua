-- TODO: switch to lua, use g:leader and g:localleader
return {
  'folke/which-key.nvim', -- https://github.com/folke/which-key.nvim

  config = function()
    require 'my.plugins.which-key.config'
  end,
}
