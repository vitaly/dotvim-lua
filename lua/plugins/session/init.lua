return {
  -------------------------------------------------------------------------------
  -- SESSION MANAGEMENT
  -------------------------------------------------------------------------------
  {
    'folke/persistence.nvim', -- https://github.com/folke/persistence.nvim
    event = 'BufReadPre',
    opts = { options = { 'buffers', 'curdir', 'tabpages', 'winsize', 'help', 'globals', 'skiprtp' } },
    -- stylua: ignore
    keys = {
      { "<leader>qr", function() require("persistence").load() end, desc = "Restore Session" },
      { "<leader>ql", function() require("persistence").load({ last = true }) end, desc = "Restore Last Session" },
      { "<leader>qd", function() require("persistence").stop() end, desc = "Don't Save Current Session" },
    },
  },

  -- menu groups
  require('lib.tools').register_keymap_groups {
    [ [[ <leader>g ]] ] = { name = 'Git' },
    [ [[\g]] ] = { name = 'Git/Signs' },
  },
}
