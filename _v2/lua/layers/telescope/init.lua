return {
  requires = {
    'nvim-lua/plenary.nvim',
    { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }, -- https://github.com/nvim-telescope/telescope-fzf-native.nvim
    'nvim-telescope/telescope-symbols.nvim',
    -- 'nvim-telescope/telescope-dap.nvim', -- https://github.com/nvim-telescope/telescope-dap.nvim
  },
  wants = { 'nvim-web-devicons' },
}
