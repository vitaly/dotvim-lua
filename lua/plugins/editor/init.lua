return {
  -- FOLDLINE styling
  {
    'jrudess/vim-foldtext', -- https://github.com/jrudess/vim-foldtext
    event = { 'BufReadPost', 'BufNewFile' },
  },

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
}
