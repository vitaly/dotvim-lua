-- lua/layers/editor/init.lua

return {
  'tpope/vim-repeat', -- https://github.com/tpope/vim-repeat


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
}
