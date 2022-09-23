return {
  'tpope/vim-repeat', -- https://github.com/tpope/vim-repeat

  'tpope/vim-surround', -- https://github.com/tpope/vim-surround

  'vim-scripts/greplace.vim', -- https://github.com/vim-scripts/greplace.vim

  ----------------------------------------------------------------------------------------------
  ----------------------------------------------------------------------------------------------
  -- Easy Align
  -- press 'ENTER' during selection
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

  ----------------------------------------------------------------------------------------------
  ----------------------------------------------------------------------------------------------
  -- BOOKMARKS
  {
    'MattesGroeger/vim-bookmarks', -- https://github.com/MattesGroeger/vim-bookmarks
    config = function()
      local sign_bg = vim.fn.synIDattr(vim.fn.hlID 'SignColumn', 'bg')
      vim.cmd('hi BookmarkSign guifg=magenta guibg=' .. sign_bg)
      vim.cmd('hi BookmarkAnnotationSign guifg=magenta guibg=' .. sign_bg)
      vim.g.bookmark_highlight_lines = 1
      vim.g.bookmark_center = 1
      vim.g.bookmark_display_annotation = 1
      vim.g.bookmark_auto_close = 1
    end,
  },

  ----------------------------------------------------------------------------------------------
  ----------------------------------------------------------------------------------------------
  -- UndoTree
  {
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
  },


  ----------------------------------------------------------------------------------------------
  ----------------------------------------------------------------------------------------------
  -- COLORIZ#E#R
  -- highlights colors in the sources
  -- e.g. things like #ff00ff
  {
    'norcalli/nvim-colorizer.lua', -- https://github.com/norcalli/nvim-colorizer.lua
    config = function()
      require('colorizer').setup()
    end,
  },


  ----------------------------------------------------------------------------------------------
  ----------------------------------------------------------------------------------------------
  -- Interesting Words
  -- Highlight custom words in document
  {
    'lfv89/vim-interestingwords', -- https://github.com/lfv89/vim-interestingwords
    setup = function()
      vim.g.interestingWordsGUIColors = {
        '#ff0000',
        '#00ff00',
        '#0000ff',
        '#ffff00',
        '#00ffff',
        '#ff00ff',
        '#888888',
        '#880000',
        '#008800',
        '#000088',
        '#888800',
        '#008888',
        '#880088',
        '#8800ff',
        '#88aaff',
        '#ff8800',
        '#ff4488',
        '#ffffff',
      }
      -- vim.g.interestingWordsRandomiseColors = 1
    end,
    config = function()
      vim.cmd [[
        nnoremap <silent> n <cmd>call WordNavigation(1)<cr><cmd>set hls<cr>zz
        nnoremap <silent> N <cmd>call WordNavigation(0)<cr><cmd>set hls<cr>zz
      ]]
    end,
  },

  ----------------------------------------------------------------------------------------------
  ----------------------------------------------------------------------------------------------
  -- ZOOM
  -- Toggle current window zoom
  {
    'troydm/zoomwintab.vim', -- https://github.com/troydm/zoomwintab.vim

    config = function()
      nmap('<leader>wz', '<cmd>ZoomWinTabToggle<cr>', 'Zoom')
    end,
  },

  {
    'AndrewRadev/switch.vim', -- https://github.com/AndrewRadev/switch.vim
  },

}
