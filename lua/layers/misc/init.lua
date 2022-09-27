return {
  'guns/xterm-color-table.vim', -- https://github.com/guns/xterm-color-table.vim
  config = function()
    require('layers.misc.config').setup()
  end,
}
