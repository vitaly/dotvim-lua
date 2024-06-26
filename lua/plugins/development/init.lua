return {
  {
    'guns/xterm-color-table.vim', -- https://github.com/guns/xterm-color-table.vim

    cmd = { 'XtermColorTable' },
    keys = {
      { [[<leader>SX]], '<cmd>XtermColorTable<cr>', desc = 'Xterm Color Table' },
    },

    config = function()
      vim.g.XtermColorTableDefaultOpen = 'edit'
    end,
  },
}
