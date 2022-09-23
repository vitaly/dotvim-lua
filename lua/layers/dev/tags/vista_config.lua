return {
  'liuchengxu/vista.vim', -- https://github.com/liuchengxu/vista.vim

  cmd = { 'Vista' },

  setup = function()
    vim.g.vista_default_executive = 'nvim_lsp'
    -- vim.g.vista_echo_cursor_strategy = 'floating_win'
    vim.g.vista_highlight_whole_line = 1
    vim.g.vista_stay_on_open = 0
    vim.g.vista_disable_statusline = 1

    require('which-key').register {
      ['\\'] = {
        t = { '<cmd>Vista!!<cr>', 'TagBar' },
      },
    }
  end,
}
