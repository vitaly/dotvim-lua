return function (use)
  use {
    'nvim-telescope/telescope.nvim',
    requires = {
      'nvim-lua/plenary.nvim',
    },
    setup = function ()
      print 'telescope setup'

      local nnoremap = require('vimp').nnoremap
      local silent = { silent = true }

      nnoremap(silent, '<localleader>,', [[<cmd>Telescope find_files<cr>]])

      print 'telescope setup complete'
    end,
  }
end
