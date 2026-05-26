-- modern looking folding with arrows
-- NOTE: The actual status column configuration is in lua/plugins/editor/init.lua
return {
  {
    'chrisgrieser/nvim-origami', -- https://github.com/chrisgrieser/nvim-origami
    enabled = true,
    event = 'VeryLazy',
    opts = {},
    init = function()
      vim.opt.foldlevel = 99
      vim.opt.foldlevelstart = 99
      vim.o.foldenable = true
    end,
  },
}
