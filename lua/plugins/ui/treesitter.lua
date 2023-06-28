return {
  {
    'nvim-treesitter/nvim-treesitter', -- https://github.com/nvim-treesitter/nvim-treesitter
    dependencies = {
      'JoosepAlviste/nvim-ts-context-commentstring', -- https://github.com/JoosepAlviste/nvim-ts-context-commentstring
    },
    build = ':TSUpdate',
    event = { 'BufReadPost', 'BufNewFile' },

    cmd = { 'TSUpdate', 'TSUpdateSync', 'TSToggle', 'TSBufToggle', 'TSModuleInfo' },

    keys = {
      { '<c-space>', desc = 'Increment selection' },
      { '<bs>', desc = 'Decrement selection', mode = 'x' },
    },

    opts = {

      -- treesitter based syntax highlighting
      highlight = {
        enable = true,
        disable = { 'vimdoc' },
        additional_vim_regex_highlighting = { 'markdown' },
      },

      -- indent = { enable = true },

      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = '<C-space>',
          node_incremental = '<C-space>',
          scope_incremental = false,
          node_decremental = '<bs>',
        },
      },

      -- setup commentstring based on contrext. even when syntax changes inside the file
      context_commentstring = { enable = true },

      ensure_installed = {
        'bash',
        'c',
        'comment',
        'cpp',
        'css',
        'elixir',
        'go',
        'html',
        'javascript',
        'jsdoc',
        'json',
        'lua',
        'make',
        'markdown',
        'markdown_inline',
        'python',
        'query',
        'ruby',
        -- 'rust',
        -- 'scala',
        'scss',
        'toml',
        'typescript',
        'vim',
        'yaml',
        -- -- brew install gcc
        -- -- CC=gcc-11 vim -c "TSInstall norg"
        -- 'norg', 'norg_metqa', 'norg_table',
      },
    },

    config = function(_, opts)
      -- make sure opts.ensure_installed is a unique table
      ---@type table<string, boolean>
      local ensure_installed = {}
      for _, lang in ipairs(opts.ensure_installed) do
        ensure_installed[lang] = true
      end
      opts.ensure_installed = ensure_installed

      require('nvim-treesitter.configs').setup(opts)

      -- setup folding using treesitter
      vim.opt.foldmethod = 'expr'
      vim.opt.foldexpr = 'nvim_treesitter#foldexpr()'
    end,
  },
}
