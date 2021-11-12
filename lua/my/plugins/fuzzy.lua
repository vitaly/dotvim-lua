return function (use)
  use {
    {
      'nvim-telescope/telescope.nvim',
      requires = {
        'nvim-lua/popup.nvim',
        'nvim-lua/plenary.nvim',
        'telescope-frecency.nvim',
        'telescope-fzf-native.nvim',
      },
      wants = {
        'popup.nvim',
        'plenary.nvim',
        'telescope-frecency.nvim',
        'telescope-fzf-native.nvim',
      },
      setup = function ()

        local nnoremap = require('vimp').nnoremap
        local silent = { silent = true }
        -- Navigate buffers and repos
        -- nmap(silent, '<c-a>', [[<cmd>Telescope buffers show_all_buffers=true theme=get_dropdown<cr>]])
        -- nmap(silent, '<c-e>', [[<cmd>Telescope frecency theme=get_dropdown<cr>]])
        -- nmap(silent, '<c-s>', [[<cmd>Telescope git_files theme=get_dropdown<cr>]])
        -- nmap(silent, '<c-d>', [[<cmd>Telescope find_files theme=get_dropdown<cr>]])
        -- nmap(silent, '<c-g>', [[<cmd>Telescope live_grep theme=get_dropdown<cr>]])
        nnoremap(silent, '<localleader>,', [[<cmd>Telescope find_files<cr>]])
      end,
      config = function ()
        -- local telescope = require 'telescope'
        -- telescope.setup {
        --   defaults = {
        --     layout_strategy = 'flex',
        --     scroll_strategy = 'cycle',
        --   },
        --   extensions = {
        --     frecency = { workspaces = { exo = '/home/wil/projects/research/exoplanet' } },
        --     fzf = {
        --       fuzzy = true,
        --       override_generic_sorter = true,
        --       override_file_sorter = true,
        --       case_mode = 'smart_case',
        --     },
        --   },
        --   pickers = {
        --     lsp_references = { theme = 'dropdown' },
        --     lsp_code_actions = { theme = 'dropdown' },
        --     lsp_definitions = { theme = 'dropdown' },
        --     lsp_implementations = { theme = 'dropdown' },
        --     buffers = {
        --       sort_lastused = true,
        --       previewer = false,
        --     },
        --   },
        -- }

        -- -- Extensions
        -- telescope.load_extension 'frecency'
        -- telescope.load_extension 'fzf'

      end,
      cmd = 'Telescope',
      module = 'telescope',
    },
    {
      'nvim-telescope/telescope-frecency.nvim',
      after = 'telescope.nvim',
      requires = 'tami5/sql.nvim',
    },
    {
      'nvim-telescope/telescope-fzf-native.nvim',
      run = 'make',
    },
  }
end
