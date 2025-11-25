local function telescope(cmd)
  return '<cmd>Telescope ' .. cmd .. '<cr>'
end

--- @type KeyDef[]
local maps = {
  find_files = { rhs = telescope [[find_files]], desc = 'Find File' },

  live_grep = { rhs = telescope [[live_grep]], desc = 'Live Grep' },

  commands = { rhs = telescope [[commands]], desc = 'Find Command' },

  buffers = { rhs = telescope [[buffers]], desc = 'Find buffer' },
  help_tags = { rhs = telescope [[help_tags]], desc = 'Help Tags' },

  command_history = { rhs = telescope [[command_history]], desc = 'Command History' },

  telescope = { rhs = telescope [[]], desc = 'Telescope' },
  colorschemes = { rhs = telescope [[colorscheme enable_preview=true]], desc = 'Colorscheme +preview' },
  highlights = { rhs = telescope [[highlights]], desc = 'Highlights' },

  diagnostics = { rhs = telescope [[diagnostics]], desc = 'Diagnostics' },
  autocommands = { rhs = telescope [[autocommands]], desc = 'Autocommands' },
  buf_diagnostics = { rhs = telescope [[diagnostics buffnr=0]], desc = 'Document Diagnostics' },
  grep_string = { rhs = telescope [[grep_string]], desc = 'Grep String' },
  keymaps = { rhs = telescope [[keymaps]], desc = 'Keymaps' },
  lines = { rhs = telescope [[current_buffer_fuzzy_find]], desc = 'Current Buffer Lines' },
  man_pages = { rhs = telescope [[man_pages]], desc = 'Manpages' },
  recent_fies = { rhs = telescope [[oldfiles]], desc = 'Recent Files' },
  symbols = { rhs = telescope [[symbols]], desc = 'Character S[y]mbols' },
  tagstack = { rhs = telescope [[tagstack]], desc = 'Tag[s]tack' },
  vim_options = { rhs = telescope [[vim_options]], desc = 'Vim Options' },

  marks = { rhs = telescope [[marks]], desc = 'Marks' },

  lsp_definitions = { rhs = telescope [[lsp_definitions]], desc = 'LSP Definitions', has = 'definition' },
  lsp_references = { rhs = telescope [[lsp_references]], desc = 'LSP References', has = 'references' },
  lsp_implementations = { rhs = telescope [[lsp_implementations]], desc = 'LSP Implementations' },
  lsp_type_definitions = { rhs = telescope [[lsp_type_definitions]], desc = 'LSP Type Definitions', has = 'typeDefinition' },

  lsp_document_symbols = { rhs = telescope [[lsp_document_symbols]], desc = 'LSP Document Symbols' },
  lsp_workspace_symbols = { rhs = telescope [[lsp_workspace_symbols]], desc = 'LSP Workspace Symbols' },
  lsp_dynamic_workspace_symbols = { rhs = telescope [[lsp_dynamic_workspace_symbols]], desc = 'LSP Dynamic Workspace Symbols' },

  lsp_outgoing_calls = { rhs = telescope [[lsp_outgoing_calls]], desc = 'LSP Outgoing Calls' },
  lsp_incoming_calls = { rhs = telescope [[lsp_incoming_calls]], desc = 'LSP Incoming Calls' },

  git_files = { rhs = telescope [[git_files]], desc = 'Git Files' },
  git_commits = { rhs = telescope [[git_commits]], desc = 'Git Commits' },
  git_status = { rhs = telescope [[git_status]], desc = 'Search Git Status' },
}

return maps
