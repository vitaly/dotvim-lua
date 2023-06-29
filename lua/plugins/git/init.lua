return {

  -- menu groups
  { 'folke/which-key.nvim', opts = { register = {
    [ [[ <leader>g ]] ] = { name = 'Git' },
    [ [[\g]] ] = { name = 'Git/Signs' },
  } } }, -- register menu group

  -------------------------------------------------------------------------------
  --- Gitsigns
  -------------------------------------------------------------------------------
  ---TODO: add toggle for line blame
  {
    'lewis6991/gitsigns.nvim', -- https://github.com/lewis6991/gitsigns.nvim
    event = { 'BufReadPre', 'BufNewFile' },
    cmd = { 'Gitsigns' },
    keys = {
      { [[\gs]], [[<cmd>Gitsigns toggle_signs<cr>]], desc = 'Toggle Signs' },
      { [[\gv]], [[<cmd>Gitsigns toggle_current_line_blame<cr>]], desc = 'Toggle Virtual Line Blame' },
    },
    opts = {
      signs = {
        add = { text = '+' },
        change = { text = '~' },
        changedelete = { text = '-' },
      },

      current_line_blame = true,
      current_line_blame_opts = {
        virt_text = true,
        virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
        delay = 1000,
        ignore_whitespace = false,
      },
    },
  },

  -------------------------------------------------------------------------------
  --- Fugitive
  -------------------------------------------------------------------------------
  {
    'tpope/vim-fugitive', -- https://github.com/tpope/vim-fugitive

    cmd = { 'G', 'Git', 'Gdiff', 'Gdiffsplit', 'Gvdiffsplit', 'Ghdiffsplit', 'Ggrep', 'Gedit', 'Gwrite', 'Gread' },

    -- FIXME: convert complex maps to lua
    keys = {
      -- stylua: ignore start
      { '<leader>gd', [[<cmd>Gvdiffsplit!<cr>]], desc = 'Git Diff' },
      { '<leader>gg', [[:<c-u>silent Ggrep<space>]], desc = 'Git Grep ...' },
      { '<leader>gw', [[:let @/="\\<<c-r><c-w>\\>"<cr>:set hls<cr>:silent Ggrep -w "<C-R><C-W>"<cr>:ccl<cr>:cw<cr><cr>]], desc = 'Git Grep Word' },
      { '<leader>g', [[y<cmd>let @/=escape(@", '\\[]$^*.')<cr><cmd>set hls<cr><cmd>silent Ggrep -F "<C-R>=escape(@", '\\"#')<cr>"<cr><cmd>ccl<cr><cmd>cw<cr><cr>]], mode = 'x', desc = 'Git Grep Selection', },
      { '<leader>gs', vim.cmd.G, desc = 'Git Status' },
      { '<leader>go', [[<cmd>G<cr><c-w>o]], desc = 'Git Status!' },
      { '<leader>gp', [[<cmd>G push<cr>]], desc = 'Git Push' },
      -- stylua: ignore end
    },
  },
}
