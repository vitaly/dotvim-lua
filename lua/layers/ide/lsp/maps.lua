local m = {
  lsp_info = '<cmd>LspInfo<cr>',
  lsp_log = '<cmd>LspLog<cr>',
  lsp_stop = '<cmd>LspStop<cr>',
  lsp_restart = '<cmd>LspRestart<cr>',
  lsp_debug_log = function()
    vim.lsp.set_log_level 'trace'
    require('vim.lsp.log').set_format_func(vim.inspect)
    vim.cmd [[LspLog]]
  end,

  declaration = vim.lsp.buf.declaration,

  definition = vim.lsp.buf.definition,
  type_definition = vim.lsp.buf.type_definition,
  implementation = vim.lsp.buf.implementation,
  references = vim.lsp.buf.references,

  incoming_calls = vim.lsp.buf.incoming_calls,
  outgoing_calls = vim.lsp.buf.outgoing_calls,

  document_symbol = vim.lsp.buf.document_symbol,
  workspace_symbol = vim.lsp.buf.workspace_symbol,

  code_action = vim.lsp.buf.code_action,

  signature_help = vim.lsp.buf.signature_help,

  add_workspace_folder = vim.lsp.buf.add_workspace_folder,
  remove_workspace_folder = vim.lsp.buf.remove_workspace_folder,
  list_workspace_folders = function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end,

  hover = vim.lsp.buf.hover,

  rename = vim.lsp.buf.rename,

  first_diagnostic = '<cmd>normal gg<cr><cmd>lua vim.diagnostic.goto_next()<cr>',
  next_diagnostic = vim.diagnostic.goto_next,
  prev_diagnostic = vim.diagnostic.goto_prev,
}

require('which-key').register {
  ['<leader>al'] = {
    name = 'LSP',

    i = { m.lsp_info, 'Info' },
    l = { m.lsp_log, 'Log' },
    D = { m.lsp_debug_log, 'Debug Log' },
    S = { m.lsp_stop, 'Stop' },
    R = { m.lsp_restart, 'Restart' },
  },
}

return m
