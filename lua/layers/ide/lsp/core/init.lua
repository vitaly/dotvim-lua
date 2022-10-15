-- lua/layers/ide/lsp/core/init.lua

return {

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
    -- requirements config -------------------------------------------
    -- fidget.nvim
    require('fidget').setup {}
    -- folding-nvim
    _my.au.on_lsp_attach('lsp_folding', require('folding').on_attach)
    -- lsp-colors
    require('lsp-colors').setup()

    ------------------------------------------------------------------

    require 'layers.ide.lsp.maps'

    require 'layers.ide.lsp.core.diagnostics'

    require('layers.ide.lsp.core.style').setup()

    _my.au.on_lsp_attach('lsp_attach', require 'layers.ide.lsp.core.on_attach')
  end,
}
