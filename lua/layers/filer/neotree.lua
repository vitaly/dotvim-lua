-- lua/layers/filer/neotree.lua

return {
  'nvim-neo-tree/neo-tree.nvim',
  branch = 'v2.x',

  requires = {
    'nvim-lua/plenary.nvim',
    'kyazdani42/nvim-web-devicons', -- not strictly required, but recommended
    'MunifTanjim/nui.nvim',
  },

  setup = function()
    require('layers.filer.base').setup {
      toggle = function()
        vim.cmd [[NeoTreeFocusToggle]]
      end,
      reveal = function()
        vim.cmd [[NeoTreeReveal]]
      end,
    }
  end,

  config = function()
    vim.cmd [[ let g:neo_tree_remove_legacy_commands = 1 ]]

    require('neo-tree').setup {
      close_if_last_window = true,
      sort_case_insensitive = true,

      filesystem = {
        group_empty_dirs = true,
        follow_current_file = true,
      },

      default_component_configs = {
        icon = {
          default = '',
          folder_empty = '',
        },
        git_status = {
          symbols = {
            modified = '',
            deleted = '',
            staged = '✓',
            unstaged = '✗',
            untracked = '?',
          },
        },
      }, -- default_component_configs
    } -- setup
  end,
}
