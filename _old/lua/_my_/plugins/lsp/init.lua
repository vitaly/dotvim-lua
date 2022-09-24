return {

  {
    'neovim/nvim-lspconfig', -- https://github.com/neovim/nvim-lspconfig

    requires = {
      -- https://github.com/onsails/lspkind-nvim
      { 'onsails/lspkind-nvim' },
      {
        'williamboman/nvim-lsp-installer', -- https://github.com/williamboman/nvim-lsp-installer
        requires = {
          'b0o/schemastore.nvim', -- https://github.com/b0o/schemastore.nvim
        },
      },

      -- { 'glepnir/lspsaga.nvim' }, -- https://github.com/glepnir/lspsaga.nvim

    },

    config = function()
      REQUIRE 'my.plugins.lsp.config'
    end,
  },


  -- {
  --   'nvim-lua/lsp-status.nvim', -- https://github.com/nvim-lua/lsp-status.nvim
  --   config = function()
  --     require('lsp-status').register_progress()
  --   end,
  -- },



  {
    'kosayoda/nvim-lightbulb', -- https://github.com/kosayoda/nvim-lightbulb
    config = require('my.plugins.lsp.lightbulb').config,
  },
}
