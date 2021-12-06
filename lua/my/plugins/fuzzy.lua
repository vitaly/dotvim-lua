return {
  {
    'nvim-telescope/telescope-fzf-native.nvim', -- https://github.com/nvim-telescope/telescope-fzf-native.nvim
    run = 'make',
    opt = true,
  },
  {
    'nvim-telescope/telescope.nvim',
    requires = {
      'nvim-lua/popup.nvim',
      'nvim-lua/plenary.nvim',
      'telescope-fzf-native.nvim',
      'nvim-telescope/telescope-fzy-native.nvim',
      'nvim-telescope/telescope-symbols.nvim',
      'nvim-telescope/telescope-dap.nvim', -- https://github.com/nvim-telescope/telescope-dap.nvim
    },

    wants = {
      'popup.nvim',
      'plenary.nvim',
      'telescope-fzf-native.nvim',
    },

    setup = function()
      REQUIRE 'my.plugins.fuzzy.maps'
    end,

    config = function()
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
          git_files = { theme = 'dropdown' },
          find_files = { theme = 'dropdown' },
          commands = {
            theme = 'dropdown',
            previewer = false,
          },
          buffers = {
            theme = 'dropdown',
            sort_lastused = true,
          },
          lsp_references = { theme = 'dropdown' },
          lsp_code_actions = { theme = 'dropdown' },
          lsp_definitions = { theme = 'dropdown' },
          lsp_implementations = { theme = 'dropdown' },
        },
      }

      telescope.load_extension 'fzf'
      telescope.load_extension 'fzy_native'
      telescope.load_extension 'dap'

      -- puts 'telescope configured'
    end,
    cmd = 'Telescope',
    module = 'telescope',
  },
}
