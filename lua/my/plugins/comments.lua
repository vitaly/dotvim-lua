return function (use)
  use {
    'terrortylor/nvim-comment', -- https://github.com/terrortylor/nvim-comment
    config = function ()
      require('nvim_comment').setup()
    end
  }
end
