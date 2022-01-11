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
    keys = { '`' },
    setup = function()
      vim.g.switch_mapping = '`'
    end,
  },

  {
    'wfxr/minimap.vim', -- https://github.com/wfxr/minimap.vim
    cmd = { 'Minimap', 'MinimapClose', 'MinimapToggle', 'MinimapRefresh', 'MinimapUpdateHighlight' },
    setup = function()
      -- = ['fugitive', 'nerdtree', 'tagbar', 'fzf']
      -- vim.g.minimap_auto_start = 1
      -- vim.g.minimap_auto_start_win_ente = 1
      vim.g.minimap_block_filetypes = { 'fugitive', 'nerdtree', 'tagbar', 'fzf', 'Outline' }
      -- vim.g.minimap_close_filetypes = { 'startify', 'netrw', 'vim-plug', 'Outline' }
      map('<plug>Toggle(Minimap)', '<cmd>MinimapToggle<cr>')
      nmap('<leader>TM', '<plug>Toggle(Minimap)')
    end,
  },
}
