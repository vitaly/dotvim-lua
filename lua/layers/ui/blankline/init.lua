-- lua/layers/ui/blankline.lua

return {
  'lukas-reineke/indent-blankline.nvim', -- https://github.com/lukas-reineke/indent-blankline.nvim

  -- pack/packer/start/indent-blankline.nvim/lua/indent_blankline/init.lua
  config = function()
    -- TODO: use  _my.config
    vim.g.blankline_spaces = true
    vim.g.indent_blankline_enabled = false

    require('layers.ui.blankline.config').config()

    -- require("indent_blankline.commands").disable(true)
    -- vim.g.indent_blankline_enabled = false
  end,
}
