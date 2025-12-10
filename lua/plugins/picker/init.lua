return require('lib.tools').vplug({
  'plugins.picker',

  dependencies = {
    'nvim-telescope/telescope.nvim', -- https://github.com/nvim-telescope/telescope.nvim
    'folke/snacks.nvim', -- https://github.com/folke/snacks.nvim
  },
})
