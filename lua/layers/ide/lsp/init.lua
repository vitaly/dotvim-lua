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
      require('layers.ide.lsp.config').config()
    end,
  },

  --------------------------------------------------------------------------
  -- MASIN/LSP server autoinstall
  _my.layer 'ide.lsp.install',

  --------------------------------------------------------------------------
  -- LSP Trauble
  {
    'folke/trouble.nvim', -- https://github.com/folke/trouble.nvim
    requires = 'kyazdani42/nvim-web-devicons',
    config = function()
      require('layers.ide.lsp.trouble').config()
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
    config = function()
      require('layers.ide.lsp.dressing').setup()
    end,
  },

  --------------------------------------------------------------------------
  -- LIGHTBULB
  -- shows a lightbulb in the gutter when there is an action to fix a diagnostic
  {
    'kosayoda/nvim-lightbulb', -- https://github.com/kosayoda/nvim-lightbulb
    requires = 'antoinemadec/FixCursorHold.nvim', -- https://github.com/antoinemadec/FixCursorHold.nvim
    config = function()
      require('layers.ide.lsp.lightbulb').setup()
    end,
  },
}
