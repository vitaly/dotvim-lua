return {
  {
    'folke/trouble.nvim', -- https://github.com/folke/trouble.nvim

    dependencies = { 'nvim-tree/nvim-web-devicons' },

    opts = {},

    init = function()
      require('which-key').add({
        { [[\D]], group = 'Diagnostics' },
      })
    end,

    keys = {
      { [[\DD]], '<cmd>Trouble diagnostics toggle<cr>', desc = 'Workspace' },
      { [[\Db]], '<cmd>Trouble diagnostics toggle filter.buf=0<cr>', desc = 'Buffer' },
      { [[\Dq]], '<cmd>Trouble quickfix toggle<cr>', desc = 'Quickfix' },
      { [[\Dl]], '<cmd>Trouble loclist toggle<cr>', desc = 'Location List' },
      { [[\D\]], function() vim.diagnostic.enable(not vim.diagnostic.is_enabled()) end, desc = 'Toggle' },

      -- ]d / [d are Neovim built-ins; only add error-specific jumps
      { ']e', function() vim.diagnostic.jump({ count = 1, severity = vim.diagnostic.severity.ERROR }) end, desc = 'Next Error' },
      { '[e', function() vim.diagnostic.jump({ count = -1, severity = vim.diagnostic.severity.ERROR }) end, desc = 'Prev Error' },
    },
  },
}
