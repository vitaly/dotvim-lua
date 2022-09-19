return {
  'hrsh7th/nvim-cmp', -- https://github.com/hrsh7th/nvim-cmp
  requires = {

    { 'windwp/nvim-autopairs' }, -- https://github.com/windwp/nvim-autopairs
    { 'onsails/lspkind-nvim' }, -- https://github.com/onsails/lspkind-nvim

    -- 'honza/vim-snippets',
    { 'rafamadriz/friendly-snippets', event = 'InsertEnter' },
    { 'hrsh7th/vim-vsnip' }, -- https://github.com/hrsh7th/vim-vsnip
    { 'hrsh7th/cmp-vsnip', after = 'nvim-cmp' },
    -- 'L3MON4D3/LuaSnip', -- https://github.com/L3MON4D3/LuaSnip
    -- { 'saadparwaiz1/cmp_luasnip', after = 'nvim-cmp' },

    { 'hrsh7th/cmp-buffer', after = 'nvim-cmp' },
    { 'hrsh7th/cmp-calc', after = 'nvim-cmp' },
    { 'hrsh7th/cmp-path', after = 'nvim-cmp' },
    { 'hrsh7th/cmp-nvim-lua', after = 'nvim-cmp' },
    { 'hrsh7th/cmp-nvim-lsp' },
  },

  config = function()
    require 'my.plugins.cmp.config'
  end,

  event = { 'InsertEnter', 'CmdlineEnter' },
}
