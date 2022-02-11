return {
  {
    'nvim-treesitter/nvim-treesitter', -- https://github.com/nvim-treesitter/nvim-treesitter
    requires = {
      -- 'nvim-treesitter/nvim-treesitter-refactor', https://github.com/nvim-treesitter/nvim-treesitter-refactor

      'nvim-treesitter/nvim-treesitter-textobjects', -- https://github.com/nvim-treesitter/nvim-treesitter-textobjects
      'JoosepAlviste/nvim-ts-context-commentstring', -- https://github.com/JoosepAlviste/nvim-ts-context-commentstring
      'p00f/nvim-ts-rainbow', -- https://github.com/p00f/nvim-ts-rainbow
      'nvim-treesitter/playground', -- https://github.com/nvim-treesitter/playground
    },
    run = ':TSUpdate',
    config = function()
      require 'my.plugins.treesitter.config'
    end,
  },
  {
    'romgrk/nvim-treesitter-context', -- https://github.com/romgrk/nvim-treesitter-context
    config = function()
      require 'my.plugins.treesitter.context'
    end,
  },
  {
    -- 'folke/todo-comments.nvim', -- https://github.com/folke/todo-comments.nvim
    'vitaly/todo-comments.nvim',
    requires = 'nvim-lua/plenary.nvim',
    config = function()
      require 'my.plugins.treesitter.todo'
    end,
  },
}
