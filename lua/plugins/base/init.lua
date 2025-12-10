return {

  {
    'vitaly/glue.nvim', -- https://github.com/vitaly/glue.nvim
  },

  {
    'vitaly/onion.nvim', -- https://github.com/vitaly/onion.nvim

    init = function()
      require('which-key').add({
        { '<leader>ao', group = 'Onion Config' },
      })
    end,

    keys = {
      { '<leader>aoe', '<cmd>Onion edit<cr>', desc = 'Edit Config' },
      { '<leader>aos', '<cmd>Onion save<cr>', desc = 'Save Config' },
      { '<leader>aoi', '<cmd>Onion show<cr>', desc = 'Show Config' },
      { '<leader>aol', '<cmd>Onion load<cr>', desc = 'Load Config' },
      { '<leader>aod', '<cmd>Onion show --defaults<cr>', desc = 'Show Default Config' },
      { '<leader>aou', '<cmd>Onion show --user<cr>', desc = 'Show User Config' },
    },

    ---@module 'onion.config'
    ---@type OnionSetupOpts
    opts = {
      save_path = vim.fn.stdpath('config') .. '/config.lua',
      auto_save = true,

      defaults = {
        log_level = vim.log.levels.WARN,

        icons = {
          diagnostics = { Error = ' ', Warn = ' ', Hint = '󰌶 ', Info = ' ' },
        },
      },
    },
  },
  {
    'vitaly/onion-ui.nvim',
    enabled = true,
    keys = {
      { '<leader>aoo', function() require('onion-ui').start() end, desc = 'Onion UI' },
    },
  },
  {
    'folke/snacks.nvim',
    priority = 1000,
    lazy = false,
    ---@type snacks.Config
    -- opts = ,

    ---@param _ any
    ---@param opts snacks.Config
    config = function(_, opts)
      local conf = require('onion.config')
      conf.set_defaults('snacks.setup', {
        bigfile = { enabled = true },
        dashboard = { enabled = false },
        explorer = { enabled = true },
        indent = { enabled = false },
        input = { enabled = true },
        picker = { enabled = true },
        notifier = { enabled = true },
        quickfile = { enabled = true },
        scope = { enabled = true },
        scroll = { enabled = true },
        statuscolumn = { enabled = false },
        words = { enabled = false },
      })

      require('snacks').setup(conf.get('snacks.setup'))
    end,
  },
}
