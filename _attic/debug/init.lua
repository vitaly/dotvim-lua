return {
  'rcarriga/nvim-dap-ui', -- https://github.com/rcarriga/nvim-dap-ui

  requires = {
    'mfussenegger/nvim-dap', -- https://github.com/mfussenegger/nvim-dap
    -- 'Pocco81/DAPInstall.nvim', -- https://github.com/Pocco81/DAPInstall.nvim
    'theHamsta/nvim-dap-virtual-text', -- https://github.com/theHamsta/nvim-dap-virtual-text
  },

  config = function()
    require 'my.plugins.debug.config'
    require 'my.plugins.debug.maps'
  end,
}
