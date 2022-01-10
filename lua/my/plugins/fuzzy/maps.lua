local which_key = require 'which-key'

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
local find_character = { '<cmd>Telescope symbols<cr>', 'Find symbol' }
local find_manpage = { '<cmd>Telescope man_pages<cr>', 'Find manpage' }

local find_document_symbol = { '<cmd>Telescope lsp_document_symbols<cr>', 'Find document symbol' }
local find_workspace_symbol = { '<cmd>Telescope lsp_workspace_symbols<cr>', 'Find workspace symbol' }
local find_workspace_dynamic_symbol = {
  '<cmd>Telescope lsp_dynamic_workspace_symbols<cr>',
  'Find workspace dynamic symbol',
}

which_key.register {

  ['<leader>'] = {
    ['<cr>'] = find_command,
    bb = find_buffer,
    H = find_help_tag,

    ['/'] = {
      name = 'Search',

      ['/'] = fuzzy_grep,
      k = find_key,
      g = fuzzy_grep,
      l = live_grep,
      c = find_character,
      b = find_buffer,
      h = find_help_tag,
      m = find_manpage,
      s = find_document_symbol,

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
