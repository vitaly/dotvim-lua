local debug = my.log.debug
return {
  {
    'nvim-treesitter/nvim-treesitter', -- https://github.com/nvim-treesitter/nvim-treesitter

    build = ':TSUpdate',
    event = { 'BufReadPost', 'BufNewFile' },

    cmd = { 'TSUpdate', 'TSUpdateSync', 'TSToggle', 'TSBufToggle', 'TSModuleInfo' },

    keys = {
      { '<c-space>', desc = 'Increment selection' },
      { '<bs>', desc = 'Decrement selection', mode = 'x' },

      { '<leader>ati', '<cmd>TSInstallInfo<cr>', desc = 'Install Info' },
      { '<leader>atm', '<cmd>TSModuleInfo<cr>', desc = 'Module Info' },
      { '<leader>atc', '<cmd>TSConfigInfo<cr>', desc = 'Config Info' },
      { '<leader>atu', '<cmd>TSUpdate<cr>', desc = 'Update' },

      { '<leader>Stm', '<cmd>TSModuleInfo<cr>', desc = 'Modules' },
      { '<leader>Stc', '<cmd>TSConfigInfo<cr>', desc = 'Config' },
    },

    init = function()
      require('lib.tools').keymap_group([[<leader>at]], 'Tree Sitter')
      require('lib.tools').keymap_group([[<leader>St]], 'Tree Sitter')
    end,

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
    end,
  },
  {
    'windwp/nvim-autopairs', -- https://github.com/windwp/nvim-autopairs
    event = 'InsertEnter',

    opts = {
      check_ts = true,
      ts_config = {},
      disable_filetype = { 'TelescopePrompt' },

      enable_check_bracket_line = true,
    },

    -- TODO: map for cmp
    config = function(_, opts)
      local autopairs = require 'nvim-autopairs'

      autopairs.setup(opts)

      autopairs.add_rules(require 'nvim-autopairs.rules.endwise-elixir')
      autopairs.add_rules(require 'nvim-autopairs.rules.endwise-ruby')
      autopairs.add_rules(require 'nvim-autopairs.rules.endwise-lua')
    end,
  },
  {
    'folke/todo-comments.nvim', -- https://github.com/folke/todo-comments.nvim
    dependencies = { 'nvim-lua/plenary.nvim' },
    cmd = { 'TodoTrouble', 'TodoTelescope' },
    event = { 'BufReadPost', 'BufNewFile' },
    keys = {
      { '<leader>st', vim.cmd.TodoTelescope, desc = 'Project TODOs' },
    },
    opts = {
      keywords = {
        TODO = { icon = ' ', color = 'info', alt = { 'TBD' } },
      },
    },
  },
}
