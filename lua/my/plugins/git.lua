return function (use)
  use {
    'tpope/vim-fugitive', -- https://github.com/tpope/vim-fugitive
    setup = function ()
      local vimp = require('vimp')
      local noremap = vimp.noremap
      local nmap = vimp.nmap
      local xmap = vimp.xmap

      vim.fn['my#keymap#leader']('g', '+Git')

      noremap('<plug>(Git/Diff)',                   [[<cmd>Gdiff<cr>]])
      noremap('<plug>(Git/Grep)',                   [[<cmd>silent Ggrep<space>]])
      noremap('<plug>(Git/Grep-Selection)',         [[y<cmd>let @/=escape(@", '\\[]$^*.')<cr><cmd>set hls<cr><cmd>silent Ggrep -F "<C-R>=escape(@", '\\"#')<cr>"<cr><cmd>ccl<cr><cmd>cw<cr><cr>]])
      noremap('<plug>(Git/Grep-Word-Under-Cursor)', [[<cmd>let @/="\\<<C-R><C-W>\\>"<cr><cmd>set hls<cr><cmd>silent Ggrep -w "<C-R><C-W>"<cr><cmd>ccl<cr><cmd>cw<cr><cr>]])
      noremap('<plug>(Git/Only-Status)',            [[<cmd>G<cr><c-W>o]])
      noremap('<plug>(Git/Status)',                 [[<cmd>G<cr>]])


      nmap('<leader>gd',                            [[<plug>(Git/Diff)]])
      nmap('<leader>gg',                            [[<plug>(Git/Grep)]])
      nmap('<leader>go',                            [[<plug>(Git/Only-Status)]])
      nmap('<leader>gs',                            [[<plug>(Git/Status)]])
      nmap('<leader>gw',                            [[<plug>(Git/Grep-Word-Under-Cursor)]])
      xmap('<leader>g',                             [[<plug>(Git/Grep-Selection)]])
    end,
    cmd = { 'G', 'Git', 'Gstatus', 'Gblame', 'Gpush', 'Gpull', 'Gdiff', 'Ggrep' },
  }
end
