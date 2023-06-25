return {
  config = function()
    vim.cmd [[ let g:neo_tree_remove_legacy_commands = 1 ]]

    local side = my.config.filer.side or 'left'
    -- DEFAULTS: pack/packer/opt/neo-tree.nvim/lua/neo-tree/defaults.lua
    require('neo-tree').setup {

      source_selector = {
        winbar = true,
      },

      use_popups_for_input = false, -- If false, inputs will use vim.ui.input() instead of custom floats.
      close_if_last_window = true,
      sort_case_insensitive = true,

      enable_refresh_on_write = false, -- requires use_libuv_file_watcher = true

      filesystem = {
        group_empty_dirs = true,
        follow_current_file = true,
        use_libuv_file_watcher = true,
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
        position = side,
        mappings = {
          ['r'] = { 'move', config = { show_path = 'relative' } }, -- no need not to allow to move for rename ;)
          ['m'] = { 'move', config = { show_path = 'relative' } },
          ['<esc>'] = 'close_window',
        },
        popup = {
          size = {
            width = '40',
          },
          position = '50%',
        },
      },
    }
  end,
}
