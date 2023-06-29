-- lua/layers/editor/init.lua

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
      vim.g.bookmark_highlight_lines = 1
      vim.g.bookmark_center = 1
      vim.g.bookmark_display_annotation = 1
      vim.g.bookmark_auto_close = 1

      my.au.on_colorscheme('editor.style', function()
        my.ui.sign_hi('BookmarkSign', 'guifg=magenta')
        my.ui.sign_hi('BookmarkAnnotationSign', 'guifg=magenta')
      end)
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
    -- 'norcalli/nvim-colorizer.lua', -- https://github.com/norcalli/nvim-colorizer.lua
    'NvChad/nvim-colorizer.lua', -- https://github.com/NvChad/nvim-colorizer.lua

    config = function()
      require('layers.editor.colorizer').config()
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
  -- WINDOW ZOOM
  -- Toggle current window zoom
  -- TODO: move to better place
  {
    'troydm/zoomwintab.vim', -- https://github.com/troydm/zoomwintab.vim

    config = function()
      nmap('\\z', '<cmd>ZoomWinTabToggle<cr>', 'Zoom')
    end,
  },

  ----------------------------------------------------------------------------------------------
  -- SWITCH
  {
    'AndrewRadev/switch.vim', -- https://github.com/AndrewRadev/switch.vim
  },

  ----------------------------------------------------------------------------------------------
  -- COMMENTS
  {
    'tpope/vim-commentary', -- https://github.com/tpope/vim-commentary/

    config = function()
      nmap('\\;', 'gcc', 'Comment')
      xmap('\\;', 'gc', 'Comment')
    end,
  },

  ----------------------------------------------------------------------------------------------
  -- FOLDLINE styling
  'jrudess/vim-foldtext', -- https://github.com/jrudess/vim-foldtext

  ----------------------------------------------------------------------------------------------
  -- EDITORCONFIG
  {
    'editorconfig/editorconfig-vim', -- https://github.com/gpanders/editorconfig.nvim
    config = function()
      local toggle_debug_editorconfig = require('lib.toggle').toggler('g:EditorConfig_verbose', { 0, 1 })
      require('which-key').register {
        ['\\'] = {
          de = { toggle_debug_editorconfig, 'Editor Config' },
        },
      }
    end,
  },
}

-- TODO: review
-- from https://alpha2phi.medium.com/neovim-plugins-for-a-better-coding-experience-part-3-d4c2df085677
-- { 'nathom/filetype.nvim' }, -- https://github.com/nathom/filetype.nvim
