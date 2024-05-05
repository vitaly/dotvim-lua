return {
  'nvim-tree/nvim-tree.lua',
  version = '*',
  lazy = false,
  dependencies = {
    'nvim-tree/nvim-web-devicons',
  },

  keys = {
    -- { '\\\\', popup, desc = 'Quick File Popup' },
    { '\\[', '<cmd>NvimTreeToggle<cr>', desc = 'Toggle File Tree' },
    { '\\]', '<cmd>NvimTreeFindFile<cr>', desc = 'Toggle / Reveal File' },
  },

  config = function()
    -- my.log.debug 'nvim-tree'
    require('nvim-tree').setup {

      view = {
        float = {
          -- enable = true,
        },
      },

      renderer = {
        indent_markers = {
          enable = true,
        },
      },

      update_focused_file = {
        enable = true,
        update_root = true,
        ignore_list = { 'help' },
      },

      diagnostics = {
        enable = true,
        show_on_dirs = true,
      },
    }
  end,
}
