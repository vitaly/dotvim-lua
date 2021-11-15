return function(use)
  use {
    'tpope/vim-commentary', -- https://github.com/tpope/vim-commentary/
    config = function()
      nmap('<plug>Toggle(comment)', 'gcc')
      xmap('<plug>Toggle(comment)', 'gc')
    end,
  }
end
