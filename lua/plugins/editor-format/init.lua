return {
  'lukas-reineke/lsp-format.nvim', -- https://github.com/lukas-reineke/lsp-format.nvim
  event = { 'BufReadPre', 'BufNewFile' },
  cmd = { 'Format', 'FormatToggle', 'FormatEnable', 'FormatDisable' },

  keys = {
    { [[<localleader>af]], [[<cmd>Format<cr>]], desc = 'Format' },
    { [[<localleader>ae]], [[<cmd>FormatEnable<cr>]], desc = 'AutoFormat Enable' },
    { [[<localleader>aE]], [[<cmd>FormatEnable!<cr>]], desc = 'AutoFormat Enable All' },
    { [[<localleader>ad]], [[<cmd>FormatDisable<cr>]], desc = 'AutoFormat Disable' },
    { [[<localleader>at]], [[<cmd>FormatToggle<cr>]], desc = 'AutoFormat Toggle' },
    { [[\a]], [[<cmd>FormatToggle<cr>]], desc = 'AutoFormat Toggle' },
  },

  opts = {
    exclude = {},
    order = {},
  },

  config = function(_, opts)
    require('lib.tools').add_keys { [[<localleader>a]], group = 'Autoformat' }
    require('lsp-format').setup(opts)
    require('lib.au').lsp_on_attach('editor.format', require('lsp-format').on_attach)
  end,
}
