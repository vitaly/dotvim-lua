return {

  {
    'ray-x/navigator.lua', -- https://github.com/ray-x/navigator.lua
    requires = {
      {
        'ray-x/guihua.lua', -- https://github.com/ray-x/guihua.lua
        run = 'cd lua/fzy && make',
      },
    },
    config = function()
      require('navigator').setup()
      print 'navigator setup'
    end,
  },

  {
    'neovim/nvim-lspconfig', -- https://github.com/neovim/nvim-lspconfig
  },

  {
    'folke/trouble.nvim', -- https://github.com/folke/trouble.nvim
    requires = 'kyazdani42/nvim-web-devicons',
    config = function()
      require('trouble').setup {}
    end,
  },
}
