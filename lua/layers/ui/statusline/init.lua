-- lua/layers/ui/statusline/init.lua
-- return {
--   'NTBBloodbath/galaxyline.nvim',
--   -- your statusline
--   config = function()
--     REQUIRE 'my.plugins.statusline.config'
--   end,
--   -- some optional icons
--   requires = { 'kyazdani42/nvim-web-devicons' },
-- }

return _my.engine(..., { 'lua_line', 'galaxy_line' })
