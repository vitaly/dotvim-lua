return {
  'nvim-lua/plenary.nvim',

  'nvim-tree/nvim-web-devicons',
  'nvim-mini/mini.icons',

  {
    'vitaly/glue.nvim', -- https://github.com/vitaly/glue.nvim
  },

  {
    'vitaly/onion.nvim',

    ---@module 'onion.config'
    ---@type OnionSetupOpts
    opts = {
      save_path = vim.fn.stdpath('config') .. '/config.lua',
      auto_save = true,
    },
  },
}
