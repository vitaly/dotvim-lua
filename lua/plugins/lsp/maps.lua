---@param command string
---@return string
local function cmd(command)
  return '<cmd>' .. command .. '<cr>'
end
--- @type KeyDef[]
local maps = {
  lsp_info = { nil, cmd 'LspInfo', desc = 'Lsp Info' },
  lsp_log = { nil, cmd 'LspLog', desc = 'Lsp Log' },
  lsp_start = { nil, cmd 'LspStart', desc = 'Lsp Stop' },
  lsp_stop = { nil, cmd 'LspStop', desc = 'Lsp Stop' },
  lsp_restart = { nil, cmd 'LspRestart', desc = 'Lsp Restart' },

  declaration = { nil, vim.lsp.buf.declaration, desc = '' },

  definition = { nil, vim.lsp.buf.definition, desc = '' },
  type_definition = { nil, vim.lsp.buf.type_definition, desc = '' },
  implementation = { nil, vim.lsp.buf.implementation, desc = '' },
  references = { nil, vim.lsp.buf.references, desc = '' },

  incoming_calls = { nil, vim.lsp.buf.incoming_calls, desc = '' },
  outgoing_calls = { nil, vim.lsp.buf.outgoing_calls, desc = '' },

  document_symbol = { nil, vim.lsp.buf.document_symbol, desc = '' },
  workspace_symbol = { nil, vim.lsp.buf.workspace_symbol, desc = '' },

  code_action = { nil, vim.lsp.buf.code_action, desc = '' },

  signature_help = { nil, vim.lsp.buf.signature_help, desc = '' },

  add_workspace_folder = { nil, vim.lsp.buf.add_workspace_folder, desc = '' },
  remove_workspace_folder = { nil, vim.lsp.buf.remove_workspace_folder, desc = '' },

  list_workspace_folders = {
    nil,
    function()
      print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end,
    desc = 'List Workspace Folders',
  },

  hover = { nil, vim.lsp.buf.hover, desc = 'Hover' },

  rename = { nil, vim.lsp.buf.rename, desc = 'Rename' },

  first_diagnostic = { nil, '<cmd>normal gg<cr><cmd>lua vim.diagnostic.goto_next()<cr>', desc = '' },
  next_diagnostic = { nil, vim.diagnostic.goto_next, desc = 'Next Diagnostic' },
  prev_diagnostic = { nil, vim.diagnostic.goto_prev, desc = 'Prev Diagnostic' },
}

return maps
