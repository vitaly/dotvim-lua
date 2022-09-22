-- config ----------------------------------------------------------------------
local telescope = require 'telescope'
local actions = require 'telescope.actions'
telescope.setup {
  defaults = {
--     layout_strategy = 'flex',
--     scroll_strategy = 'cycle',
    mappings = {
      i = {
        ['<esc>'] = actions.close,
        ['<C-j>'] = actions.move_selection_next,
        ['<C-k>'] = actions.move_selection_previous,
      },
    },
  },
--   extensions = {
--     fzf = {
--       fuzzy = true,
--       override_generic_sorter = true,
--       override_file_sorter = true,
--       case_mode = 'smart_case',
--     },
--     fzy_native = {
--       override_generic_sorter = false,
--       override_file_sorter = true,
--     },
--   },
  pickers = {
    help_tags = { theme = 'ivy' },
    git_files = { theme = 'ivy' },
    find_files = { theme = 'ivy' },
    commands = {
      theme = 'ivy',
    },
    buffers = {
      theme = 'ivy',
      sort_lastused = true,
    },
    lsp_code_actions = { theme = 'cursor' },
    lsp_references = { theme = 'ivy' },
    lsp_definitions = { theme = 'ivy' },
    lsp_implementations = { theme = 'ivy' },
  },
}

-- -- extensions ------------------------------------------------------------------
-- telescope.load_extension 'fzf'
-- telescope.load_extension 'fzy_native'
-- telescope.load_extension 'dap'

-- keymaps ---------------------------------------------------------------------
local function find_file()
  return pcall(require('telescope.builtin').git_files) or require('telescope.builtin').find_files()
end

local find_command = '<cmd>Telescope commands<cr>'

local find_buffer = '<cmd>Telescope buffers<cr>'
local find_help_tag = '<cmd>Telescope help_tags<cr>'
local find_key = '<cmd>Telescope keymaps<cr>'
local live_grep = '<cmd>Telescope live_grep<cr>'
local fuzzy_grep = '<cmd>Telescope grep_string search=<cr>'
local find_character = '<cmd>Telescope symbols<cr>'
local find_manpage = '<cmd>Telescope man_pages<cr>'
local find_document_symbol = '<cmd>Telescope lsp_document_symbols<cr>'
local find_workspace_symbol = '<cmd>Telescope lsp_workspace_symbols<cr>'
local find_workspace_dynamic_symbol = '<cmd>Telescope lsp_dynamic_workspace_symbols<cr>'

require('which-key').register {

  ['<leader>'] = {
    ['<cr>'] = { find_command, 'Find command' },
    bb = { find_buffer, 'Find buffer' },
    h = { find_help_tag, 'Help' },
    s = { find_document_symbol, 'Find document symbol' },

    ['/'] = {
      name = 'Find',

      ['/'] = { fuzzy_grep, 'Fuzzy Grep' },

      b = { find_buffer, 'Buffer' },
      c = { find_character, 'Character Symbol' },
      g = { live_grep, 'Live Grep' },
      h = { find_help_tag, 'Help' },
      k = { find_key, 'Key' },
      m = { find_manpage, 'Manpage' },
      s = { find_document_symbol, 'Document symbol' },

      w = {
        name = 'Workspace',

        s = { find_workspace_symbol, 'Symbol' },
        S = { find_workspace_dynamic_symbol, 'Dynamic symbol' },
      },
    },
  },

  ['<localleader>'] = {
    ['<localleader>'] = { find_file, 'Find file' },
  },
}
