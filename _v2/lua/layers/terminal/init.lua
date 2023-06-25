return {
  {
    'akinsho/toggleterm.nvim', -- https://github.com/akinsho/toggleterm.nvim

    tag = '*',

    config = function()
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

      tnoremap('<A-[>', '<C-\\><C-n>')

      require('toggleterm').setup {
        open_mapping = [[<c-\>]],

        size = function(term)
          if term.direction == 'horizontal' then
            return 25
          elseif term.direction == 'vertical' then
            return vim.o.columns * 0.4
          end
        end,
      }

      local function tig()
        require('toggleterm.terminal').Terminal:new({ cmd = 'tig', direction = 'float' }):toggle()
      end

      require('which-key').register {
        ['<leader>'] = {
          gt = { tig, 'TIG' },
        },
      }
    end,
  },
  {
    'vitaly/vim-tmux-navigator', -- https://github.com/christoomey/vim-tmux-navigator

    config = function()
      local up = '<cmd>TmuxNavigateUp<cr>'
      local down = '<cmd>TmuxNavigateDown<cr>'
      local left = '<cmd>TmuxNavigateLeft<cr>'
      local right = '<cmd>TmuxNavigateRight<cr>'

      nnoremap('<leader>wk', up, 'silent', 'Navigate Up')
      nnoremap('<leader>wj', down, 'silent', 'Navigate Down')
      nnoremap('<leader>wh', left, 'silent', 'Navigate Left')
      nnoremap('<leader>wl', right, 'silent', 'Navigate Right')

      tnoremap('<m-k>', '<c-\\><c-n>' .. up, 'silent')
      tnoremap('<m-j>', '<c-\\><c-n>' .. down, 'silent')
      tnoremap('<m-h>', '<c-\\><c-n>' .. left, 'silent')
      tnoremap('<m-l>', '<c-\\><c-n>' .. right, 'silent')

      cnoremap('<m-k>', up, 'silent')
      cnoremap('<m-j>', down, 'silent')
      cnoremap('<m-h>', left, 'silent')
      cnoremap('<m-l>', right, 'silent')
    end,
  },
}
