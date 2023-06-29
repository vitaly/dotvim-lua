return {
      -- FOLDLINE styling
      {
        'jrudess/vim-foldtext', -- https://github.com/jrudess/vim-foldtext
        event = { 'BufReadPost', 'BufNewFile' },
      },
}
