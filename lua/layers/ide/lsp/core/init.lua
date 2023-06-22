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
    -- COLORS
    -- add missing theme highlights
    'folke/lsp-colors.nvim', -- https://github.com/folke/lsp-colors.nvim
  },

  config = function()
    -- requirements config -------------------------------------------
    -- fidget.nvim
    require('fidget').setup {}
    -- lsp-colors
    require('lsp-colors').setup()

    require('lspconfig.ui.windows').default_options.border = 'single'

    ------------------------------------------------------------------
    -- servers config ------------------------------------------------

    -- require('lspconfig').ruby_ls.setup{}

    ------------------------------------------------------------------
    require 'layers.ide.lsp.maps'

    require 'layers.ide.lsp.core.diagnostics'

    require('layers.ide.lsp.core.style').setup()

    _my.au.on_lsp_attach('lsp_attach', require 'layers.ide.lsp.core.on_attach')
  end,
}
