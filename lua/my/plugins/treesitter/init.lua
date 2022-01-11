return {
  'nvim-treesitter/nvim-treesitter', -- https://github.com/nvim-treesitter/nvim-treesitter
  requires = {
    -- 'nvim-treesitter/nvim-treesitter-refactor', https://github.com/nvim-treesitter/nvim-treesitter-refactor

    'nvim-treesitter/nvim-treesitter-textobjects', -- https://github.com/nvim-treesitter/nvim-treesitter-textobjects
    'JoosepAlviste/nvim-ts-context-commentstring', -- https://github.com/JoosepAlviste/nvim-ts-context-commentstring
    'p00f/nvim-ts-rainbow', -- https://github.com/p00f/nvim-ts-rainbow
  },
  run = ':TSUpdate',
  config = function()
    REQUIRE 'my.plugins.treesitter.config'
  end,
}
