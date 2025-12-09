return require('lib.actions').register('lsp.actions', {
  ['lsp.actions.lsp_info'] = function() vim.cmd.LspInfo() end,
  ['lsp.actions.lsp_log'] = function() vim.cmd.LspLog() end,
  ['lsp.actions.lsp_start'] = function() vim.cmd.LspStart() end,
  ['lsp.actions.lsp_stop'] = function() vim.cmd.LspStop() end,
  ['lsp.actions.lsp_restart'] = function() vim.cmd.LspRestart() end,
  ['lsp.actions.lsp_workspace_folders'] = function() print(vim.inspect(vim.lsp.buf.list_workspace_folders())) end,

  -- diagnostics
  ['lsp.actions.diagnostic.first'] = function() vim.diagnostic.jump({ count = -vim._maxint, wrap = false }) end,
  ['lsp.actions.diagnostic.previous'] = function() vim.diagnostic.jump({ count = -vim.v.count1 }) end,
  ['lsp.actions.diagnostic.next'] = function() vim.diagnostic.jump({ count = vim.v.count1 }) end,
  ['lsp.actions.diagnostic.last'] = function() vim.diagnostic.jump({ count = vim._maxint, wrap = false }) end,

  -- buf
  ['lsp.actions.add_workspace_folder'] = function() vim.lsp.buf.add_workspace_folder() end,
  ['lsp.actions.code_action'] = function() vim.lsp.buf.code_action() end,
  ['lsp.actions.declaration'] = function() vim.lsp.buf.declaration() end,
  ['lsp.actions.definition'] = function() vim.lsp.buf.definition() end,
  ['lsp.actions.document_symbol'] = function() vim.lsp.buf.document_symbol() end,
  ['lsp.actions.implementation'] = function() vim.lsp.buf.implementation() end,
  ['lsp.actions.incoming_calls'] = function() vim.lsp.buf.incoming_calls() end,
  ['lsp.actions.outgoing_calls'] = function() vim.lsp.buf.outgoing_calls() end,
  ['lsp.actions.references'] = function() vim.lsp.buf.references() end,
  ['lsp.actions.remove_workspace_folder'] = function() vim.lsp.buf.remove_workspace_folder() end,
  ['lsp.actions.rename'] = function() vim.lsp.buf.rename() end,
  ['lsp.actions.signature_help'] = function() vim.lsp.buf.signature_help() end,
  ['lsp.actions.type_definition'] = function() vim.lsp.buf.type_definition() end,
  ['lsp.actions.workspace_symbol'] = function() vim.lsp.buf.workspace_symbol() end,
})
