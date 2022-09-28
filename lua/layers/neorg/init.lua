return {
  'nvim-neorg/neorg', -- https://github.com/nvim-neorg/neorg
  -- branch = 'unstable',
  branch = 'main',

  after = { 'nvim-treesitter', 'telescope.nvim' },

  requires = {
    'nvim-neorg/neorg-telescope',
  },

  run = ':Neorg sync-parsers',

  config = function()
    require('layers.neorg.config').config()
  end,
}
