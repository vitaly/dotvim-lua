return function (use)
  -- XXX: TODO: TBD: lazy load
  use {
    'terrortylor/nvim-comment', -- https://github.com/terrortylor/nvim-comment
    config = function ()
      require('nvim_comment').setup()

      noremap('<plug>Comment(toggle)', '<cmd>CommentToggle<cr>')

      nmap('<leader>;', '<plug>Comment(toggle)')
      xmap('<leader>;', ':CommentToggle<cr>')
    end
  }
end
