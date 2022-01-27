-- config ----------------------------------------------------------------------
local telescope = require 'telescope'
local actions = require 'telescope.actions'
telescope.setup {
  defaults = {
    layout_strategy = 'flex',
    scroll_strategy = 'cycle',
    mappings = {
      i = {
        ['<esc>'] = actions.close,
        ['<C-j>'] = actions.move_selection_next,
        ['<C-k>'] = actions.move_selection_previous,
      },
    },
  },
  extensions = {
    fzf = {
      fuzzy = true,
      override_generic_sorter = true,
      override_file_sorter = true,
      case_mode = 'smart_case',
    },
    fzy_native = {
      override_generic_sorter = false,
      override_file_sorter = true,
    },
  },
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

-- extensions ------------------------------------------------------------------
telescope.load_extension 'fzf'
telescope.load_extension 'fzy_native'
telescope.load_extension 'dap'

-- keymaps ---------------------------------------------------------------------
local find_file = {
  function()
    return pcall(require('telescope.builtin').git_files) or require('telescope.builtin').find_files()
  end,
  'Find file',
}
local find_command = { '<cmd>Telescope commands<cr>', 'Find command' }
local find_buffer = { '<cmd>Telescope buffers<cr>', 'Find buffer' }
local find_help_tag = { '<cmd>Telescope help_tags<cr>', 'Search for help tags' }
local find_key = { '<cmd>Telescope keymaps<cr>', 'Search key' }
local live_grep = { '<cmd>Telescope live_grep<cr>', 'Live Grep' }
local fuzzy_grep = { '<cmd>Telescope grep_string search=<cr>', 'Fuzzy Grep' }
local find_character = { '<cmd>Telescope symbols<cr>', 'Find Character Symbol' }
local find_manpage = { '<cmd>Telescope man_pages<cr>', 'Find manpage' }

local find_document_symbol = { '<cmd>Telescope lsp_document_symbols<cr>', 'Find document symbol' }
local find_workspace_symbol = { '<cmd>Telescope lsp_workspace_symbols<cr>', 'Find workspace symbol' }
local find_workspace_dynamic_symbol = {
  '<cmd>Telescope lsp_dynamic_workspace_symbols<cr>',
  'Find workspace dynamic symbol',
}

require('which-key').register {

  ['<leader>'] = {
    ['<cr>'] = find_command,
    bb = find_buffer,
    h = find_help_tag,

    ['/'] = {
      name = 'Search',

      ['/'] = fuzzy_grep,
      ['.'] = find_document_symbol,

      k = find_key,
      g = live_grep,
      c = find_character,
      b = find_buffer,
      h = find_help_tag,
      m = find_manpage,

      w = {
        name = 'Workspace',

        s = find_workspace_symbol,
        S = find_workspace_dynamic_symbol,
      },
    },
  },

  ['<localleader>'] = {
    ['<localleader>'] = find_file,
  },
}
