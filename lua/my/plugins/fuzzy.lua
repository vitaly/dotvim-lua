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
        local vimp = require('vimp')
        local noremap = vimp.noremap
        local nmap = vimp.nmap
        local silent = { silent = true }

        noremap('<plug>Find(file)', function ()
          return pcall(require'telescope.builtin'.git_files) or require'telescope.builtin'.find_files()
        end)
        noremap('<plug>Find(buffer)', '<cmd>Telescope buffers<cr>')
        noremap('<plug>Search(live)', '<cmd>Telescope live_grep<cr>')
        noremap('<plug>Help()', '<cmd>Telescope help_tags<cr>')
        noremap('<plug>Find(command)', '<cmd>Telescope commands<cr>')


        nmap('<localleader><localleader>', '<plug>Find(file)')
        nmap('<leader>bb', '<plug>Find(buffer)')
        nmap('<leader>/', '<plug>Search(live)')
        nmap('<leader>H', '<plug>Help()')
        nmap('<leader><cr>', '<plug>Find(command)')

        print 'telescope setup complete'
      end,

      config = function ()
        local telescope = require 'telescope'
        telescope.setup {
          defaults = {
            layout_strategy = 'flex',
            scroll_strategy = 'cycle',
          },
        --   extensions = {
        --     fzf = {
        --       fuzzy = true,
        --       override_generic_sorter = true,
        --       override_file_sorter = true,
        --       case_mode = 'smart_case',
        --     },
        --   },
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

        -- puts 'telescope configured'
      end,
      cmd = 'Telescope',
      module = 'telescope',
    },
  }
end
