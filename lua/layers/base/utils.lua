-- lua/layers/base/utils.lua

return {
  'kyazdani42/nvim-web-devicons', -- https://github.com/kyazdani42/nvim-web-devicons

  {
    'folke/persistence.nvim', -- https://github.com/folke/persistence.nvim
    event = 'BufReadPre',
    keys = { '<leader>Q' },

    config = function()
      require('persistence').setup {
        options = { 'buffers', 'curdir', 'tabpages', 'winsize', 'help', 'globals', 'skiprtp' },
      }
      require('which-key').register {
        [ [[<leader>Q]] ] = {
          -- stylua: ignore start
          r = { function() require('persistence').load() end, 'Restore Session', },
          l = { function() require('persistence').load { last = true } end, 'Restore Last Session', },
          d = { function() require('persistence').stop() end, "Don't Save Current Session", },
        },
      }
    end,
  },
}
