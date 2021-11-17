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
    },

    wants = {
      'popup.nvim',
      'plenary.nvim',
      'telescope-fzf-native.nvim',
    },

    setup = function()
      local vimp = require 'vimp'
      local noremap = vimp.noremap
      local nmap = vimp.nmap
      -- local silent = { silent = true }

      noremap('<plug>Find(file)', function()
        return pcall(require('telescope.builtin').git_files) or require('telescope.builtin').find_files()
      end)
      noremap('<plug>Find(buffer)', '<cmd>Telescope buffers<cr>')
      noremap('<plug>Search(live)', '<cmd>Telescope live_grep<cr>')
      noremap('<plug>Search(grep)', '<cmd>Telescope grep_string<cr>')
      noremap('<plug>Help()', '<cmd>Telescope help_tags<cr>')
      noremap('<plug>Find(command)', '<cmd>Telescope commands<cr>')
      noremap('<plug>Find(key)', '<cmd>Telescope keymaps<cr>')

      nmap('<localleader><localleader>', '<plug>Find(file)')
      nmap('<leader>bb', '<plug>Find(buffer)')
      nmap('<leader>/', '<plug>Search(grep)')
      nmap('<leader>sg', '<plug>Search(grep)')
      nmap('<leader>sl', '<plug>Search(live)')
      nmap('<leader>H', '<plug>Help()')
      nmap('<leader><cr>', '<plug>Find(command)')
      nmap('<leader>?', '<plug>Find(key)')

      -- print 'telescope setup complete'
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
        }
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

      -- puts 'telescope configured'
    end,
    cmd = 'Telescope',
    module = 'telescope',
  },
}
