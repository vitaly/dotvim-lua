-- lua/layers/ide/cmp/init.lua

return {

  {
    config = function()
      require('layers.ide.cmp.config').config()
    end,
  },

  my.layer 'ide.cmp.copilot',
}

-- return {
--   requires = {

--
--     { 'hrsh7th/cmp-calc', after = 'nvim-cmp' },

--     -- 'honza/vim-snippets',
--     -- 'L3MON4D3/LuaSnip', -- https://github.com/L3MON4D3/LuaSnip
--     -- { 'saadparwaiz1/cmp_luasnip', after = 'nvim-cmp' },
--   },

-- }
