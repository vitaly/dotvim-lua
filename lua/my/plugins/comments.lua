return function (use)
  use {
    'terrortylor/nvim-comment', -- https://github.com/terrortylor/nvim-comment
    config = function ()
      require('nvim_comment').setup()

      noremap('<plug>Comment(toggle)', '<cmd>CommentToggle<cr>')

      nmap('<leader>;', '<plug>Comment(toggle)')
      xmap('<leader>;', '<plug>Comment(toggle)')
    end,
    disable = true,
  }


  use {
    'tomtom/tcomment_vim', -- https://github.com/tomtom/tcomment_vim

    config = function ()
      map({'silent'}, '<plug>Comment(toggle)', '<Plug>TComment_gcc')
      nmap('<leader>;', '<plug>Comment(toggle)')
      xmap('<leader>;', '<plug>Comment(toggle)')
    end
  }
end
