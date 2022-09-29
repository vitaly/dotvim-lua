-- lua/layers/filer/neotree.lua

return {
  'nvim-neo-tree/neo-tree.nvim', -- https://github.com/nvim-neo-tree/neo-tree.nvim
  branch = 'v2.x',

  requires = {
    'nvim-lua/plenary.nvim',
    'kyazdani42/nvim-web-devicons',
    'MunifTanjim/nui.nvim',
  },

  setup = function()
    require('layers.filer.maps').setup {
      toggle = function()
        vim.cmd [[NeoTreeFocusToggle]]
      end,
      reveal = function()
        vim.cmd [[NeoTreeReveal!]]
        vim.cmd [[Neotree filesystem reveal reveal_force_cwd]]
      end,

      popup = function()
        vim.cmd [[Neotree filesystem reveal float reveal_force_cwd]]
      end,
    }
  end,

  config = function()
    require('layers.filer.neotree.config').config()
  end,
}
