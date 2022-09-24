-- lua/layers/telescope/config.lua

local function setup()
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
      -- fzf = {
      --   fuzzy = true,
      --   override_generic_sorter = true,
      --   override_file_sorter = true,
      --   case_mode = 'smart_case',
      -- },
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
      lsp_references = { theme = 'cursor' },
      lsp_definitions = { theme = 'cursor' },
      lsp_implementations = { theme = 'cursor' },
    },
  }

  -- -- extensions ------------------------------------------------------------------
  telescope.load_extension 'fzf'
  -- TODO: dap extension
  -- telescope.load_extension 'dap'

  -- keymaps ---------------------------------------------------------------------
  require 'layers.telescope.maps'
end

return {
  setup = setup,
}
