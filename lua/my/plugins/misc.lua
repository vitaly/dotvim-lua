return {
  'chriskempson/base16-vim',
  'tpope/vim-repeat',
  'tpope/vim-surround',
  {
    'editorconfig/editorconfig-vim',
    config = function()
      require 'my.toggle'
      local editorconfig_verbose_toggle = MakeSwitch({
        g = 'EditorConfig_verbose',
        states = { 0, 1 },
      }).toggler
      require('which-key').register {
        ['\\'] = {
          de = { editorconfig_verbose_toggle, 'Editorconfig' },
        },
      }
    end,
  },
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
      vim.g.switch_mapping = '`'
      -- nmap('`', '<cmd>Switch<cr>')
    end,
    -- cmd = { 'Switch' },
  },

  -- TBD: finish config
  { 'stevearc/dressing.nvim' }, -- https://github.com/stevearc/dressing.nvim

  -- from https://alpha2phi.medium.com/neovim-plugins-for-a-better-coding-experience-part-3-d4c2df085677
  -- { 'nathom/filetype.nvim' }, -- https://github.com/nathom/filetype.nvim

  -- bookmarks
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
}
