-- lua/layers/filer/neotree.lua

-- defaults are in pack/packer/opt/neo-tree.nvim/lua/neo-tree/defaults.lua
return {
  'nvim-neo-tree/neo-tree.nvim', -- https://github.com/nvim-neo-tree/neo-tree.nvim
  branch = 'v2.x',

  requires = {
    'nvim-lua/plenary.nvim',
    'kyazdani42/nvim-web-devicons',
    'MunifTanjim/nui.nvim',
  },

  setup = function()
    require('layers.filer.maps').setup {
      toggle = function()
        vim.cmd [[NeoTreeFocusToggle]]
      end,
      reveal = function()
        vim.cmd [[NeoTreeReveal]]
      end,

      popup = function()
        vim.cmd [[Neotree filesystem reveal float]]
      end,
    }
  end,

  config = function()
    vim.cmd [[ let g:neo_tree_remove_legacy_commands = 1 ]]

    require('neo-tree').setup {

      source_selector = {
        winbar = true,
      },

      use_popups_for_input = false, -- If false, inputs will use vim.ui.input() instead of custom floats.
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

      window = {
        mappings = {
          ['r'] = { 'move', config = { show_path = 'relative' } }, -- no need not to allow to move for rename ;)
          ['m'] = { 'move', config = { show_path = 'relative' } },
          ['<esc>'] = 'close_window',
        },
      },
    } -- setup
  end,
}
