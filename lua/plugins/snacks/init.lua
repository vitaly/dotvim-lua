return {
  'folke/snacks.nvim',
  dependencies = {
    'onion.nvim',
  },
  priority = 1000,
  lazy = false,
  ---@type snacks.Config

  ---@param _ any
  ---@param opts snacks.Config
  config = function()
    local conf = require('onion.config')
    conf.set_defaults('snacks.setup', {
      bigfile = { enabled = true },
      dashboard = { enabled = true },
      explorer = { enabled = true },
      indent = { enabled = false },
      input = { enabled = true },
      picker = { enabled = true },
      notifier = { enabled = true },
      quickfile = { enabled = true },
      scope = { enabled = true },
      scroll = { enabled = false },
      statuscolumn = { enabled = false },
      words = { enabled = false },
    })

    require('snacks').setup(conf.get('snacks.setup'))
    require('plugins.snacks.actions').setup()
  end,
}
