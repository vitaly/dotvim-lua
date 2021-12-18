return {

  {
    -- https://github.com/neovim/nvim-lspconfig
    'neovim/nvim-lspconfig',

    requires = {
      -- https://github.com/onsails/lspkind-nvim
      { 'onsails/lspkind-nvim' },
      -- https://github.com/williamboman/nvim-lsp-installer
      { 'williamboman/nvim-lsp-installer' },
      -- https://github.com/glepnir/lspsaga.nvim
      { 'glepnir/lspsaga.nvim' },
      -- https://github.com/pierreglaser/folding-nvim
      { 'pierreglaser/folding-nvim', branch = 'nvim-nightly' },
    },

    config = function()
      REQUIRE 'my.plugins.lsp.config'
      REQUIRE 'my.plugins.lsp.diagnostics'
      REQUIRE 'my.plugins.lsp.maps'
    end,
  },

  -- {
  --   'jose-elias-alvarez/null-ls.nvim',

  --   requires = { 'nvim-lua/plenary.nvim', 'neovim/nvim-lspconfig' },

  --   config = function()
  --     require('null-ls').config {
  --       sources = {
  --         require('null-ls').builtins.formatting.prettier,
  --         require('null-ls').builtins.formatting.shfmt,
  --         require('null-ls').builtins.formatting.stylua,
  --         require('null-ls').builtins.formatting.trim_whitespace,
  --         -- require("null-ls").builtins.diagnostics.shellcheck,
  --         -- require('null-ls').builtins.completion.spell,
  --       },
  --     }

  --     require('lspconfig')['null-ls'].setup {
  --       -- on_attach = function (client, bufnr)
  --       --   -- vim.g.null_client = client
  --       --   -- vim.g.null_bufnr = bufnr
  --       -- end
  --     }
  --   end,
  -- },

  -- https://github.com/folke/lsp-colors.nvim
  {
    'folke/lsp-colors.nvim',
    config = function()
      require('lsp-colors').setup()
    end,
  },

  -- https://github.com/nvim-lua/lsp-status.nvim
  -- {
  --   'nvim-lua/lsp-status.nvim',
  --   config = function()
  --     require('lsp-status').register_progress()
  --   end,
  -- },

  -- https://github.com/folke/trouble.nvim
  {
    'folke/trouble.nvim',
    requires = 'kyazdani42/nvim-web-devicons',
    config = function()
      require('trouble').setup {}
    end,
  },

  -- https://github.com/ray-x/lsp_signature.nvim
  {
    'ray-x/lsp_signature.nvim',
    config = function()
      require('lsp_signature').setup {
        bind = true,
        hint_enable = false,
        handler_opts = {
          border = 'rounded',
        },
      }
    end,
  },

  {
    'kosayoda/nvim-lightbulb', -- https://github.com/kosayoda/nvim-lightbulb
    config = require('my.plugins.lsp.lightbulb').config,
  },
}
