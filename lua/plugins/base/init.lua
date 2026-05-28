_t('base')

return {

  ------------------------------------------------------------------------------
  -- glue
  ------------------------------------------------------------------------------
  {
    'vitaly/glue.nvim', -- https://github.com/vitaly/glue.nvim
  },

  ------------------------------------------------------------------------------
  -- onion.nvim
  ------------------------------------------------------------------------------
  {
    'vitaly/onion.nvim', -- https://github.com/vitaly/onion.nvim

    lazy = false,
    priority = 100,

    init = function() require('which-key').add({ { '<leader>ao', group = 'Onion Config' } }) end,

    keys = {
      { '<leader>aoe', '<cmd>Onion edit<cr>', desc = 'Edit Config' },
      { '<leader>aos', '<cmd>Onion save<cr>', desc = 'Save Config' },
      { '<leader>aoi', '<cmd>Onion show<cr>', desc = 'Show Config' },
      { '<leader>aol', '<cmd>Onion load<cr>', desc = 'Load Config' },
      { '<leader>aod', '<cmd>Onion show --defaults<cr>', desc = 'Show Default Config' },
      { '<leader>aou', '<cmd>Onion show --user<cr>', desc = 'Show User Config' },
    },
  },

  ------------------------------------------------------------------------------
  -- onion-ui.nvim
  ------------------------------------------------------------------------------
  {
    'vitaly/onion-ui.nvim',
    keys = {
      { '<leader>aoo', function() require('onion-ui').start() end, desc = 'Onion UI' },
    },
  },

  ------------------------------------------------------------------------------
  -- lazydev.nvim
  ------------------------------------------------------------------------------
  {
    'folke/lazydev.nvim', -- https://github.com/folke/lazydev.nvim
    ft = 'lua',
    opts = {
      library = {
        'nvim-dap-ui',
        -- Load luvit types when the `vim.uv` word is found
        { path = '${3rd}/luv/library', words = { 'vim%.uv' } },
      },
    },
  },
}
