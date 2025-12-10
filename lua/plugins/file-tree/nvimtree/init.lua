return {
  'nvim-tree/nvim-tree.lua',
  version = '*',
  lazy = false,
  dependencies = {
    'nvim-tree/nvim-web-devicons',
  },

  config = function()
    local glue = require('glue').register('file-tree.nvimtree')

    -- glue.handle('file-tree.actions.popup', function()  end)
    glue.handle('file-tree.actions.toggle', function() vim.cmd('NvimTreeToggle') end)
    glue.handle('file-tree.actions.reveal', function() vim.cmd('NvimTreeFindFile') end)

    require('nvim-tree').setup({
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
    })
  end,
}
