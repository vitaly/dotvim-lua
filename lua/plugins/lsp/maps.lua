---@param command string
---@return string
local function cmd(command)
  return '<cmd>' .. command .. '<cr>'
end

local prev_diagnostic = function()
  vim.diagnostic.jump({ count = 1 })
end

local next_diagnostic = function()
  vim.diagnostic.jump({ count = -1 })
end

--- @type KeyDef[]
local maps = {
  lsp_health = { rhs = cmd('checkhealth lsp'), desc = 'LSP Health' },
  lsp_info = { rhs = cmd('LspInfo'), desc = 'LSP Info' },
  lsp_log = { rhs = cmd('LspLog'), desc = 'LSP Log' },
  lsp_start = { rhs = cmd('LspStart'), desc = 'LSP Start' },
  lsp_stop = { rhs = cmd('LspStop'), desc = 'LSP Stop' },
  lsp_restart = { rhs = cmd('LspRestart'), desc = 'LSP Restart' },

  definition = { rhs = vim.lsp.buf.definition, desc = 'Definition', has = 'definition' },
  declaration = { rhs = vim.lsp.buf.declaration, desc = 'Declaration', has = 'declaration' },

  type_definition = { rhs = vim.lsp.buf.type_definition, desc = 'Type Definition', has = 'typeDefinition' },
  implementation = { rhs = vim.lsp.buf.implementation, desc = 'Implementation' },
  references = { rhs = vim.lsp.buf.references, desc = 'References', has = 'references' },

  incoming_calls = { rhs = vim.lsp.buf.incoming_calls, desc = 'Incoming Calls' },
  outgoing_calls = { rhs = vim.lsp.buf.outgoing_calls, desc = 'Outgoing Calls' },

  document_symbol = { rhs = vim.lsp.buf.document_symbol, desc = 'Document Symbol' },
  workspace_symbol = { rhs = vim.lsp.buf.workspace_symbol, desc = 'Workspace Symbol' },

  code_action = { rhs = vim.lsp.buf.code_action, desc = 'Code Action', has = 'codeAction' },

  signature_help = { rhs = vim.lsp.buf.signature_help, desc = 'Signature Help', has = 'signatureHelp' },

  add_workspace_folder = { rhs = vim.lsp.buf.add_workspace_folder, desc = 'Add Workspace Folder' },
  remove_workspace_folder = { rhs = vim.lsp.buf.remove_workspace_folder, desc = 'Remove Workspace Folder' },

  list_workspace_folders = {
    rhs = function()
      print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end,
    desc = 'LSP Workspace Folders',
  },

  hover = { rhs = vim.lsp.buf.hover, desc = 'Hover' },

  rename = { rhs = vim.lsp.buf.rename, desc = 'Rename' },

  first_diagnostic = { rhs = '<cmd>normal gg<cr><cmd>lua vim.diagnostic.goto_next()<cr>', desc = '' },
  next_diagnostic = { rhs = next_diagnostic, desc = 'Next Diagnostic' },
  prev_diagnostic = { rhs = prev_diagnostic, desc = 'Prev Diagnostic' },
}

return maps
