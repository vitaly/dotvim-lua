-- lua/layers/telescope/maps.lua

local builtin = require 'telescope.builtin'

-- which kinds to ignore when displaying document symbols
-- this is a 'per filetype' setting
local ignore_symbols = {
  lua = { 'variable', 'string', 'array' },
  typescript = { 'property' },
}

local function custom_document_symbols()
  local bufnr = vim.api.nvim_get_current_buf()
  local filetype = vim.api.nvim_buf_get_option(bufnr, 'filetype')
  builtin.lsp_document_symbols {
    ignore_symbols = ignore_symbols[filetype] or {},
  }
end

local m = {
  files = function()
    return pcall(builtin.git_files) or builtin.find_files()
  end,

  find_files = builtin.find_files,
  git_files = builtin.git_files,

  commands = builtin.commands,

  telescope = ':<cmd>Telescope<cr>',

  tagstack = builtin.tagstack,

  live_grep = builtin.live_grep,
  grep_string = builtin.grep_string,

  buffers = builtin.buffers,
  help_tags = builtin.help_tags,
  keymaps = builtin.keymaps,
  symbols = builtin.symbols,
  map_pages = builtin.man_pages,

  treesitter = builtin.treesitter,
  current_buffer_fuzzy_find = builtin.current_buffer_fuzzy_find,

  lsp = {
    definition = builtin.lsp_definitions,
    type_definition = builtin.lsp_type_definitions,
    implementation = builtin.lsp_implementations,
    references = builtin.lsp_references,

    incoming_calls = builtin.lsp_incoming_calls,
    outgoing_calls = builtin.lsp_outgoing_calls,

    document_symbol = builtin.lsp_document_symbols,
    custom_document_symbol = custom_document_symbols,
    workspace_symbol = builtin.lsp_workspace_symbols,
    dynamic_workspace_symbol = builtin.lsp_dynamic_workspace_symbols,
  },

  diagnostics = builtin.diagnostics,
}

require('which-key').register {

  ['<localleader>'] = {
    ['<localleader>'] = { m.find_files, 'Find file' },
  },

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
      l = { m.current_buffer_fuzzy_find, 'Lines' },
      m = { m.map_pages, 'Manpage' },

      s = { m.tagstack, 'Tag Stack' },

      ['<space>'] = { m.telescope, 'Telescope' },
      t = {
        name = 'Telescope',

        f = { m.find_files, 'Find Files' },
        g = { m.git_files, 'Git Files' },
      },
    },
  },
}

require('which-key').register {}

return m
