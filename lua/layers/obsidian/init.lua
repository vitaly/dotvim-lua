return {
  'epwalsh/obsidian.nvim', -- https://github.com/epwalsh/obsidian.nvim

  config = function()
    require('layers.obsidian.config').setup()
  end,
}
