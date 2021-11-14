return function (use)
  -- XXX: TODO: TBD: lazy load
  use {
    'terrortylor/nvim-comment', -- https://github.com/terrortylor/nvim-comment
    config = function ()
      require('nvim_comment').setup()

      local vimp = require('vimp')
      local noremap = vimp.nmap

      noremap('<plug>Comment(toggle)', '<cmd>CommentToggle<cr>')

      local nmap = vimp.nmap
      nmap('<leader>;', '<plug>Comment(toggle)')
      local xmap = vimp.xmap
      xmap('<leader>;', ':CommentToggle<cr>')
    end
  }
end
