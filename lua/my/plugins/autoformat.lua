-- https://github.com/lukas-reineke/format.nvim
return {
  'lukas-reineke/format.nvim',

  config = function()
    REQUIRE 'my.plugins.autoformat.config'
    REQUIRE 'my.plugins.autoformat.maps'
  end,
}
