return {
  --------------------------------------------------------------------------
  -- FOLDING
  {
    'pierreglaser/folding-nvim', -- https://github.com/pierreglaser/folding-nvim
    branch = 'nvim-nightly',

    config = function()
      _my.au.on_lsp_attach('lsp_folding', require('folding').on_attach)
    end,
  },
}
