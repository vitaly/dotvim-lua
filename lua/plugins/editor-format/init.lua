return {
  'lukas-reineke/lsp-format.nvim', -- https://github.com/lukas-reineke/lsp-format.nvim
  event = { 'BufReadPre', 'BufNewFile' },
  opts = {
    exclude = {},
    order = {},
  },

  config = function(_, opts)
    require('lsp-format').setup(opts)
    require('lib.au').lsp_on_attach('editor.format', require('lsp-format').on_attach)
  end,
}
