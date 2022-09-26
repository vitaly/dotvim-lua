return {
  'b0o/incline.nvim', -- https://github.com/b0o/incline.nvim

  config = function()
    require('layers.ui.statusline.incline.config').setup()
  end,
}
