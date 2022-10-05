return {
  {
    'akinsho/toggleterm.nvim', -- https://github.com/akinsho/toggleterm.nvim

    tag = '*',

    config = function()
      require('toggleterm').setup {

        open_mapping = [[<c-\>]],
      }
      vim.cmd [[
        highlight TermCursor ctermfg=red guifg=red

        augroup TerminalInsertHandling
          au!
          " for some reason clicking in a terminal buffer exists insert mode
          au TermOpen                 *  nnoremap <buffer><LeftRelease> <LeftRelease>i
          " start in insert more
          au TermOpen,BufEnter,FocusGained term://*  startinsert

        augroup END

      ]]
      -- au TermEnter term://*toggleterm#* tnoremap <silent><c-t> <Cmd>exe v:count1 . "ToggleTerm"<CR>

      tnoremap('<A-[>', '<C-\\><C-n>')
    end,
  },
  {
    'vitaly/vim-tmux-navigator', -- https://github.com/christoomey/vim-tmux-navigator

    config = function()
      require('layers.terminal.tmux').config()
    end,
  },
}
