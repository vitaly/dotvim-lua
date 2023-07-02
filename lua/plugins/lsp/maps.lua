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

  definition = { nil, vim.lsp.buf.definition, desc = 'Definition', has = 'definition' },
  declaration = { nil, vim.lsp.buf.declaration, desc = 'Declaration', has = 'declaration' },

  type_definition = { nil, vim.lsp.buf.type_definition, desc = 'Type Definition', has = 'typeDefinition' },
  implementation = { nil, vim.lsp.buf.implementation, desc = 'Implementation' },
  references = { nil, vim.lsp.buf.references, desc = 'References', has = 'references' },

  incoming_calls = { nil, vim.lsp.buf.incoming_calls, desc = 'Incoming Calls' },
  outgoing_calls = { nil, vim.lsp.buf.outgoing_calls, desc = 'Outgoing Calls' },

  document_symbol = { nil, vim.lsp.buf.document_symbol, desc = 'Document Symbol' },
  workspace_symbol = { nil, vim.lsp.buf.workspace_symbol, desc = 'Workspace Symbol' },

  code_action = { nil, vim.lsp.buf.code_action, desc = 'Code Action', has = 'codeAction' },

  signature_help = { nil, vim.lsp.buf.signature_help, desc = 'Signature Help', has = 'signatureHelp' },

  add_workspace_folder = { nil, vim.lsp.buf.add_workspace_folder, desc = 'Add Workspace Folder' },
  remove_workspace_folder = { nil, vim.lsp.buf.remove_workspace_folder, desc = 'Remove Workspace Folder' },

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
