-- lua/layers/ide/lsp/config/init.lua

return {
  setup = function()
    -- requirements config -------------------------------------------
    -- fidget.nvim
    require('fidget').setup {}
    -- folding-nvim
    _my.au.on_lsp_attach('lsp_folding', require('folding').on_attach)
    -- lsp-colors
    require('lsp-colors').setup()

    ------------------------------------------------------------------

    require 'layers.ide.lsp.maps'

    require('layers.ide.lsp.config.style').setup()

    _my.au.on_lsp_attach('lsp_attach', require 'layers.ide.lsp.config.on_attach')
  end,
}
