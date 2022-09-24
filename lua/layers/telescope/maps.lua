local m = {
  find_file = function()
    return pcall(require('telescope.builtin').git_files) or require('telescope.builtin').find_files()
  end,

  commands = require('telescope.builtin').commands,

  telescope = ':<cmd>Telescope<cr>',

  tagstack = require('telescope.builtin').tagstack,

  live_grep = require('telescope.builtin').live_grep,
  grep_string = require('telescope.builtin').grep_string,

  buffers = require('telescope.builtin').buffers,
  help_tags = require('telescope.builtin').help_tags,
  keymaps = require('telescope.builtin').keymaps,
  symbols = require('telescope.builtin').symbols,
  map_pages = require('telescope.builtin').man_pages,

  lsp = {
    definition = require('telescope.builtin').lsp_definitions,
    type_definition = require('telescope.builtin').lsp_type_definitions,
    implementation = require('telescope.builtin').lsp_implementations,
    references = require('telescope.builtin').lsp_references,

    incoming_calls = require('telescope.builtin').lsp_incoming_calls,
    outgoing_calls = require('telescope.builtin').lsp_outgoing_calls,

    document_symbol = require('telescope.builtin').lsp_document_symbols,
    workspace_symbol = require('telescope.builtin').lsp_workspace_symbols,
    dynamic_workspace_symbol = require('telescope.builtin').lsp_dynamic_workspace_symbols,
  },

  diagnostics = require('telescope.builtin').diagnostics,
}

require('which-key').register {

  ['<leader>'] = {
    ['<cr>'] = { m.commands, 'Find command' },
    bb = { m.buffers, 'Find buffer' },
    h = { m.help_tags, 'Help' },

    ['/'] = {
      name = 'Find',

      ['/'] = { m.grep_string, 'Fuzzy Grep' },

      b = { m.buffers, 'Buffer' },
      c = { m.symbols, 'Character Symbol' },
      g = { m.live_grep, 'Live Grep' },
      h = { m.help_tags, 'Help' },
      k = { m.keymaps, 'Key' },
      m = { m.map_pages, 'Manpage' },

      t = { m.tagstack, 'Tag Stack' },

      T = { m.telescope, 'Telescope' },
    },

    -- l = {
    --   name = 'LSP',

    --   s = { m.lsp_document_symbol, 'Document symbol' },
    --   d = { m.lsp_definitions, 'Definition' },
    --   t = { m.lsp_type_definitions, 'Type definition' },
    --   i = { m.lsp_implementations, 'Implementation' },
    --   r = { m.lsp_references, 'References' },
    --   a = { m.lsp_code_actions, 'Code actions' },

    --   w = {
    --     name = 'Workspace',

    --     s = { m.lsp_workspace_symbol, 'Symbol' },
    --     d = { m.lsp_dynamic_workspace_symbols, 'Dynamic symbol' },
    --   },
    -- },
  },

  ['<localleader>'] = {
    ['<localleader>'] = { m.find_file, 'Find file' },
  },
}

require('which-key').register {}

return m
