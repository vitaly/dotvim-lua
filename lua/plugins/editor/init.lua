return {
  ----------------------------------------------------------------------------------------------
  ----------------------------------------------------------------------------------------------
  -- FOLDLINE styling
  {
    'jrudess/vim-foldtext', -- https://github.com/jrudess/vim-foldtext
    event = { 'BufReadPost', 'BufNewFile' },
  },

  ----------------------------------------------------------------------------------------------
  ----------------------------------------------------------------------------------------------
  -- REMEMBER LAST FILE LOCATION
  { 'ethanholz/nvim-lastplace', opts = {} }, -- https://github.com/ethanholz/nvim-lastplace

  ----------------------------------------------------------------------------------------------
  ----------------------------------------------------------------------------------------------
  -- BOOKMARKS
  {
    'MattesGroeger/vim-bookmarks', -- https://github.com/MattesGroeger/vim-bookmarks
    opts = {
      bookmark_highlight_lines = true,
      bookmark_center = true,
      bookmark_display_annotation = true,
      bookmark_auto_close = true,
    },
    config = function(_, opts)
      vim.g.bookmark_highlight_lines = opts.bookmark_highlight_lines and 1 or 0
      vim.g.bookmark_center = opts.bookmark_center and 1 or 0
      vim.g.bookmark_display_annotation = opts.bookmark_display_annotation and 1 or 0
      vim.g.bookmark_auto_close = opts.bookmark_auto_close and 1 or 0
    end,
  },

  ----------------------------------------------------------------------------------------------
  ----------------------------------------------------------------------------------------------
  -- UndoTree
  {
    'mbbill/undotree', -- http://github.com/mbbill/undotree
    event = { 'BufReadPost', 'BufNewFile' },

    keys = {
      { [[g=]], [[<cmd>later<cr>]], desc = 'Go to newer text state' },
      { [[\u]], '<cmd>UndotreeToggle<cr>', desc = 'Undo Tree' },
    },

    init = function()
      vim.g.undotree_SetFocusWhenToggle = 1
    end,
  },

  ----------------------------------------------------------------------------------------------
  ----------------------------------------------------------------------------------------------
  -- WINDOW ZOOM
  -- Toggle current window zoom
  {
    'troydm/zoomwintab.vim', -- https://github.com/troydm/zoomwintab.vim

    keys = {
      { [[\z]], '<cmd>ZoomWinTabToggle<cr>', desc = 'Zoom' },
    },
  },

  ----------------------------------------------------------------------------------------------
  ----------------------------------------------------------------------------------------------
  -- SWITCH
  {
    'AndrewRadev/switch.vim', -- https://github.com/AndrewRadev/switch.vim

    keys = { 'gs' },
    cmd = { 'Switch', 'SwitchExtend', 'SwitchRevers' },
  },

  ----------------------------------------------------------------------------------------------
  ----------------------------------------------------------------------------------------------
  -- ALIGN
  { 'echasnovski/mini.align', version = '*', opts = {} }, -- https://github.com/echasnovski/mini.align

  ----------------------------------------------------------------------------------------------
  ----------------------------------------------------------------------------------------------
  -- SEARCH AND REPLACE
  {
    'vim-scripts/greplace.vim', -- https://github.com/vim-scripts/greplace.vim
    cmd = { 'Gsearch', 'Gbuffersearch', 'Greplace' },
  },
}
