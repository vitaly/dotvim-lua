-- lua/layers/ide/lsp/maps.lua

local m = {
  lsp_debug_log = function()
    vim.lsp.set_log_level 'trace'
    require('vim.lsp.log').set_format_func(vim.inspect)
    vim.cmd [[LspLog]]
  end,
}

require('which-key').register {
  ['<leader>al'] = {
    name = 'LSP',

    D = { m.lsp_debug_log, 'Debug Log' },
  },
}

return m
