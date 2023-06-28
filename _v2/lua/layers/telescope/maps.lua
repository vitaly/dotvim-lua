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
  local filetype = vim.api.nvim_get_option_value('filetype', { buf = bufnr or 0 })
  builtin.lsp_document_symbols {
    ignore_symbols = ignore_symbols[filetype] or {},
  }
end

local m = {
  files = function()
    return pcall(builtin.git_files) or builtin.find_files()
  end,

  treesitter = builtin.treesitter,

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

  ['<leader>'] = {

    ['/'] = {
      name = 'Find',

      ['<space>'] = { [[Telescope]], 'Telescope' },
    },
  },
}

require('which-key').register {}

return m
