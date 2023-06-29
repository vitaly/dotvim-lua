return {
  -- FOLDLINE styling
  {
    'jrudess/vim-foldtext', -- https://github.com/jrudess/vim-foldtext
    event = { 'BufReadPost', 'BufNewFile' },
  },

  -- REMEMBER LAST FILE LOCATION
  { 'ethanholz/nvim-lastplace', opts = {} }, -- https://github.com/ethanholz/nvim-lastplace
}
