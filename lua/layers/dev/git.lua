-- lua/layers/dev/git.lua

return {
  {
    'lewis6991/gitsigns.nvim',

    config = function()
      require('gitsigns').setup()
    end,
  },
  {
    'tpope/vim-fugitive', -- https://github.com/tpope/vim-fugitive

    setup = function()
      local diff = [[<cmd>Gvdiffsplit!<cr>]]
      local grep = [[:<c-u>silent Ggrep<space>]]
      local grep_selection = [[y<cmd>let @/=escape(@", '\\[]$^*.')<cr><cmd>set hls<cr><cmd>silent Ggrep -F "<C-R>=escape(@", '\\"#')<cr>"<cr><cmd>ccl<cr><cmd>cw<cr><cr>]]
      local grep_word = [[:let @/="\\<<C-R><C-W>\\>"<CR>:set hls<CR>:silent Ggrep -w "<C-R><C-W>"<CR>:ccl<CR>:cw<CR><CR>]]
      local status = [[<cmd>G<cr>]]
      local status_only = [[<cmd>G<cr><c-W>o]]

      local which_key = require 'which-key'
      which_key.register {

        ['<leader>'] = {
          g = {
            name = 'Git',

            d = { diff, 'Diff' },
            -- g = { grep, 'Grep' },
            s = { status, 'Status' },
            o = { status_only, 'Status (only)' },
            w = { grep_word, 'Grep word' },
          },
        },
      }

      -- for some reason this doesn't work via which_key
      nnoremap('<space>gg', grep, 'Grep')

      which_key.register({
        ['<leader>'] = {
          g = { grep_selection, 'Grep selection' },
        },
      }, { mode = 'x' })
    end,

    cmd = { 'G', 'Git', 'Gdiff', 'Gdiffsplit', 'Gvdiffsplit', 'Ghdiffsplit', 'Ggrep', 'Gedit', 'Gwrite', 'Gread' },
  },
}
