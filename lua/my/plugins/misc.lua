return {
  'chriskempson/base16-vim',
  'tpope/vim-repeat',
  'tpope/vim-surround',
  'editorconfig/editorconfig-vim',
  'jrudess/vim-foldtext',
  'vim-scripts/greplace.vim', -- https://github.com/vim-scripts/greplace.vim

  {
    'norcalli/nvim-colorizer.lua', -- https://github.com/norcalli/nvim-colorizer.lua
    config = function()
      require('colorizer').setup()
    end,
  },

  {
    'github/copilot.vim',
    setup = function()
      vim.g.copilot_no_tab_map = 1
      vim.g.copilot_assume_mapped = 1
      inoremap('<plug>key(tab)', '<tab>')
      imap({ 'nowait', 'expr' }, '<C-Space>', [[copilot#Accept("\<plug>key(tab)")]])
    end,
  },

  {
    'junegunn/vim-easy-align', -- https://github.com/junegunn/vim-easy-align
    config = function()
      xmap('<Enter>', '<Plug>(LiveEasyAlign)')

      require('which-key').register({
        ['<leader>a'] = {
          name = 'EasyAlign',

          ['='] = { ':EasyAlign /}/<cr>', '=' },
          ['-'] = { ':EasyAlign /}/<cr>', '-' },
          ['{'] = { ':EasyAlign /}/<cr>', '{' },
          ['}'] = { ':EasyAlign /}/<cr>', '}' },
        },
      }, { mode = 'x' })
    end,
  },

  {
    'AndrewRadev/switch.vim', -- https://github.com/AndrewRadev/switch.vim
    setup = function()
      vim.g.switch_mapping = ''
      nmap('`', '<cmd>Switch<cr>')
    end,
    cmd = { 'Switch' },
  },
}
