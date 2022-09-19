return {
  'mbbill/undotree',
  config = function()
    vim.g.undotree_SetFocusWhenToggle = 1

    require('which-key').register {
      ['g='] = { '<cmd>later<cr>', 'Go to newer text state' },

      ['\\'] = {
        u = { '<cmd>UndotreeToggle<cr>', 'Undo Tree' },
      },
    }
  end,
}
