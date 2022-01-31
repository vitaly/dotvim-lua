-- https://github.com/nvim-neorg/neorg
return {
  'nvim-neorg/neorg',
  -- branch = 'unstable',
  branch = 'main',
  requires = { 'nvim-lua/plenary.nvim', 'nvim-neorg/neorg-telescope', 'nvim-telescope/telescope.nvim' },
  config = function()
    require 'my.plugins.neorg.config'
  end, -- /config=
}
