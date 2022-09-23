return {
  'hrsh7th/nvim-cmp', -- https://github.com/hrsh7th/nvim-cmp

  -- TODO: event
  -- event = { 'InsertEnter', 'CmdlineEnter' },

  requires = {
    { 'onsails/lspkind-nvim' }, -- https://github.com/onsails/lspkind-nvim

    -----------------------------------
    -- snippets -----------------------
    { 'hrsh7th/vim-vsnip' }, -- https://github.com/hrsh7th/vim-vsnip
    {
      'rafamadriz/friendly-snippets',
      -- TODO: event
      -- event = 'InsertEnter',
    },


    -----------------------------------
    -- sources ------------------------

    -- LSP source
    { 'hrsh7th/cmp-nvim-lsp' }, -- https://github.com/hrsh7th/cmp-nvim-lsp
    -- buffer source
    { 'hrsh7th/cmp-buffer' }, -- https://github.com/hrsh7th/cmp-buffer
    -- command line source
    { 'hrsh7th/cmp-cmdline' }, -- https://github.com/hrsh7th/cmp-cmdline
    -- path source
    { 'hrsh7th/cmp-path' }, -- https://github.com/hrsh7th/cmp-path
    -- Nvim -- Lua API source
    { 'hrsh7th/cmp-nvim-lua' }, -- https://github.com/hrsh7th/cmp-nvim-lua

    -- snippets source
    { 'hrsh7th/cmp-vsnip' },

  },


  config = function()
    require('layers.ide.cmp.config').setup()
  end,
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

