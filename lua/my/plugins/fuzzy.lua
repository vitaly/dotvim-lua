return function (use)
  use {
    -- https://github.com/nvim-telescope/telescope-fzf-native.nvim
    {'nvim-telescope/telescope-fzf-native.nvim', run = 'make', opt = true },
    {
      'nvim-telescope/telescope.nvim',
      requires = {
        'nvim-lua/popup.nvim',
        'nvim-lua/plenary.nvim',
        'telescope-fzf-native.nvim',
      },

      wants = {
        'popup.nvim',
        'plenary.nvim',
        'telescope-fzf-native.nvim',
      },

      setup = function ()
        -- print 'telescope setup'

        local nnoremap = require('vimp').nnoremap
        local silent = { silent = true }

        nnoremap(silent, '<localleader>,', [[<cmd>Telescope find_files<cr>]])

        print 'telescope setup complete'
      end,
      config = function ()
        local telescope = require 'telescope'
        telescope.setup {
        --   defaults = {
        --   },
        --   extensions = {
        --     fzf = {
        --       fuzzy = true,
        --       override_generic_sorter = true,
        --       override_file_sorter = true,
        --       case_mode = 'smart_case',
        --     },
        --   },
          pickers = {
            git_files = { theme = 'dropdown' },
            find_files = { theme = 'dropdown' },
        --     lsp_references = { theme = 'dropdown' },
        --     lsp_code_actions = { theme = 'dropdown' },
        --     lsp_definitions = { theme = 'dropdown' },
        --     lsp_implementations = { theme = 'dropdown' },
        --     buffers = {
        --       sort_lastused = true,
        --       previewer = false,
        --     },
          },
        }

        telescope.load_extension 'fzf'

        -- puts 'telescop configured'
      end,
      cmd = 'Telescope',
      module = 'telescope',
    },
  }
end
