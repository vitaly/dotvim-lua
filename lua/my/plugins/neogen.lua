return function (use)
  use {
    'danymat/neogen',
    requires = 'nvim-treesitter',
    config = function ()
      require('neogen').setup {
        enabled = true,
        jump_map = '<tab>',
      }

      local vimp = require('vimp')

      local noremap = vimp.noremap
      noremap('<plug>Neogen(generate)',          '<cmd>lua require("neogen").generate()<cr>')
      noremap('<plug>Neogen(generate-func)',     '<cmd>lua require("neogen").generate({ type = "func" })<cr>')
      noremap('<plug>Neogen(generate-class)',    '<cmd>lua require("neogen").generate({ type = "class" })<cr>')
      noremap('<plug>Neogen(generate-type)',     '<cmd>lua require("neogen").generate({ type = "type" })<cr>')

      local nmap = vimp.nmap
      nmap('<localleader>dd',  '<plug>Neogen(generate)')
      nmap('<localleader>df', '<plug>Neogen(generate-func)')
      nmap('<localleader>dc', '<plug>Neogen(generate-class)')
      nmap('<localleader>dt', '<plug>Neogen(generate-type)')

    end,
    keys = { '<localleader>dd', '<localleader>df', '<localleader>dc', '<localleader>dt' },
  }
end
