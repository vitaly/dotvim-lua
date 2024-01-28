return {
  -------------------------------------------------------------------------------
  -- manage lazy itself. use the latest STABLE version
  -------------------------------------------------------------------------------
  {
    'folke/lazy.nvim', -- https://github.com/folke/lazy.nvim
    version = '*',

    -- keys are in lua/plugins/base-keymaps/init.lua

    init = function()
      require('lib.tools').keymap_group([[<leader>az]], 'Lazy')
    end,
  },
}
