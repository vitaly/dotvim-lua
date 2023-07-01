-- lua/layers/editor/init.lua

return {
  'tpope/vim-repeat', -- https://github.com/tpope/vim-repeat

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
}

-- TODO: review
-- from https://alpha2phi.medium.com/neovim-plugins-for-a-better-coding-experience-part-3-d4c2df085677
-- { 'nathom/filetype.nvim' }, -- https://github.com/nathom/filetype.nvim
