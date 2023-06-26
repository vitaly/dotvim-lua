-- TODO: Add support for Base16 and shell integration
return {
  {
    'folke/tokyonight.nvim', -- https://github.com/folke/tokyonight.nvim
    lazy = false,
    priority = 1000,

    config = function()
      vim.cmd [[colorscheme tokyonight]]
    end,
  },
}
