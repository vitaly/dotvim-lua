return {
  {
    -- 'nvim-telescope/telescope.nvim',
    requires = {
      'nvim-lua/popup.nvim',
      -- 'nvim-lua/plenary.nvim',
      'telescope-fzf-native.nvim',
      'nvim-telescope/telescope-fzy-native.nvim',
      'nvim-telescope/telescope-symbols.nvim',
      'nvim-telescope/telescope-dap.nvim', -- https://github.com/nvim-telescope/telescope-dap.nvim
    },

    wants = {
      'popup.nvim',
      'plenary.nvim',
      'telescope-fzf-native.nvim',
    },

  },
}
