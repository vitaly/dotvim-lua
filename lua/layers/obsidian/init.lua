return {
  'epwalsh/obsidian.nvim', -- https://github.com/epwalsh/obsidian.nvim

  dependencies = {
    -- Required.
    'nvim-lua/plenary.nvim',

    -- Optional, for completion.
    'hrsh7th/nvim-cmp',

    -- Optional, for search and quick-switch functionality.
    'nvim-telescope/telescope.nvim',

    -- Optional, an alternative to telescope for search and quick-switch functionality.
    -- "ibhagwan/fzf-lua"

    -- Optional, another alternative to telescope for search and quick-switch functionality.
    -- "junegunn/fzf",
    -- "junegunn/fzf.vim"

    -- Optional, alternative to nvim-treesitter for syntax highlighting.
    -- "godlygeek/tabular",
    -- "preservim/vim-markdown",
  },

  config = function()
    local dir = (_my.config.obsidian or {}).dir or '~/vault'
    -- print('obsidian dir = ' .. dir)
    require('obsidian').setup {
      dir = dir,
      completion = {
        nvim_cmp = true,
      },
    }
  end,
}
