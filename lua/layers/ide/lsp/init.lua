-- lua/layers/ide/lsp/init.lua

return {
  --------------------------------------------------------------------------
  -- LSP Config
  {
    'neovim/nvim-lspconfig', -- https://github.com/neovim/nvim-lspconfig

    requires = {
      --------------------------------------------------------------------------
      --------------------------------------------------------------------------
      -- config for those requirements is in the lsp.config module
      --------------------------------------------------------------------------
      --------------------------------------------------------------------------

      --------------------------------------------------------------------------
      -- Simple progress widget for LSP
      'j-hui/fidget.nvim', -- https://github.com/j-hui/fidget.nvim

      --------------------------------------------------------------------------
      -- FOLDING
      { -- { 'vitaly/folding-nvim' },
        'pierreglaser/folding-nvim', -- https://github.com/pierreglaser/folding-nvim
        branch = 'nvim-nightly',
      },

      --------------------------------------------------------------------------
      -- COLORS
      -- add missing theme highlights
      'folke/lsp-colors.nvim', -- https://github.com/folke/lsp-colors.nvim
    },

    config = function()
      require('layers.ide.lsp.config').setup()
    end,
  },

  --------------------------------------------------------------------------
  -- MASIN/LSP server autoinstall
  {
    'williamboman/mason-lspconfig.nvim', -- https://github.com/williamboman/mason-lspconfig.nvim

    requires = {
      'williamboman/mason.nvim', -- https://github.com/williamboman/mason.nvim
    },

    config = function()
      require('layers.ide.lsp.install').setup()
    end,
  },

  --------------------------------------------------------------------------
  -- LSP Trauble
  {
    'folke/trouble.nvim', -- https://github.com/folke/trouble.nvim
    requires = 'kyazdani42/nvim-web-devicons',
    config = function()
      require('layers.ide.lsp.trouble').setup()
    end,
  },

  --------------------------------------------------------------------------
  -- SIGNATURE
  {
    'ray-x/lsp_signature.nvim', -- https://github.com/ray-x/lsp_signature.nvim

    config = function()
      require('layers.ide.lsp.signature').setup()
    end,
  },

  --------------------------------------------------------------------------
  -- LSP Dressing (UI improvements)
  {
    'stevearc/dressing.nvim', -- https://github.com/stevearc/dressing.nvim
  },
}
