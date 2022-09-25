-- lua/layers/filer/nvimtree.lua,

return {
  'kyazdani42/nvim-tree.lua',
  tag = 'nightly',

  requires = {
    'kyazdani42/nvim-web-devicons', -- optional, for file icons
  },

  setup = function()
    require('layers.filer.maps').setup {
      toggle = function()
        require('nvim-tree').toggle()
      end,
      reveal = function()
        require('nvim-tree').find_file(true)
      end,
    }
  end,

  module = 'nvim-tree',
  cmd = { 'NvimTreeToggle', 'NvimTreeFindFile', 'NvimTreeFocus' },

  config = function()
    require('nvim-tree').setup {
      sort_by = 'case_sensitive',

      create_in_closed_folder = true,
      hijack_cursor = true,

      view = {
        adaptive_size = true,
        mappings = {
          list = {
            { key = 'u', action = 'dir_up' },
          },
        },
      },
      renderer = {
        group_empty = true,
        highlight_git = true,
        indent_markers = {
          enable = true,
        },
      },
      filters = {
        dotfiles = false,
      },
      actions = {
        open_file = {
          quit_on_open = false,
          window_picker = {
            enable = false,
          },
        },
      },
      update_focused_file = {
        enable = true,
        update_root = true,
        ignore_list = {},
      },
      diagnostics = {
        enable = true,
      },
    }
  end,
}
