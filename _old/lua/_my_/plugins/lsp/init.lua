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

      -- https://github.com/pierreglaser/folding-nvim
      -- { 'pierreglaser/folding-nvim', branch = 'nvim-nightly' },
      { 'vitaly/folding-nvim' },
    },

    config = function()
      REQUIRE 'my.plugins.lsp.config'
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

  {
    'folke/lsp-colors.nvim', -- https://github.com/folke/lsp-colors.nvim
    config = function()
      require('lsp-colors').setup()
    end,
  },

  -- {
  --   'nvim-lua/lsp-status.nvim', -- https://github.com/nvim-lua/lsp-status.nvim
  --   config = function()
  --     require('lsp-status').register_progress()
  --   end,
  -- },

  {
    'folke/trouble.nvim', -- https://github.com/folke/trouble.nvim
    requires = 'kyazdani42/nvim-web-devicons',
    config = function()
      require 'my.plugins.lsp.trouble-config'
    end,
  },

  {
    'ray-x/lsp_signature.nvim', -- https://github.com/ray-x/lsp_signature.nvim
    config = function()
      require('lsp_signature').setup {
        bind = true,
        floating_window = true,
        hint_enable = true,
        hint_prefix = 'ℹ️',
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
