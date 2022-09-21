return {
  {
    'folke/which-key.nvim',                    -- https://github.com/folke/which-key.nvim
  },

  {
    'b0o/mapx.nvim',                           -- https://github.com/b0o/mapx.nvim

    as = 'keymaps', -- so that we can change the plugin that provides globals for nnoremap etc.
    after = 'which-key.nvim',
    config = function()
      require('mapx').setup { global = 'force', whichkey = true }
    end,
  },
}
