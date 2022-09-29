-- lua/layers/ide/tsitter/init.lua

return {
  -------------------------------------------------------------------------------------------------------------
  -------------------------------------------------------------------------------------------------------------
  -- TREESITTER
  -------------------------------------------------------------------------------------------------------------
  -------------------------------------------------------------------------------------------------------------
  {
    'nvim-treesitter/nvim-treesitter', -- https://github.com/nvim-treesitter/nvim-treesitter

    -- FIXME: this doesn't work for some reason
    -- the plugin/nvim-treesitter.lua is not being loaded for some reason
    -- run = ':TSUpdate',

    requires = {
      'nvim-treesitter/playground', -- https://github.com/nvim-treesitter/playground
      -- setup commentstring based on contrext. even when syntax changes inside the file
      'JoosepAlviste/nvim-ts-context-commentstring', -- https://github.com/JoosepAlviste/nvim-ts-context-commentstring
      'nvim-treesitter/nvim-treesitter-textobjects', -- https://github.com/nvim-treesitter/nvim-treesitter-textobjects
    },

    config = function()
      require('layers.ide.tsitter.config').config()
    end,
  },

  -------------------------------------------------------------------------------------------------------------
  -- CONTEXT
  -- this plugin shows a bit of context at the top of the file, e.g. what class / function we are currently in.
  {
    'romgrk/nvim-treesitter-context', -- https://github.com/romgrk/nvim-treesitter-context
    config = function()
      require('layers.ide.tsitter.context').config()
    end,
  },

  -------------------------------------------------------------------------------------------------------------
  -- TODO
  {
    'folke/todo-comments.nvim', -- https://github.com/folke/todo-comments.nvim
    -- 'vitaly/todo-comments.nvim',
    requires = 'nvim-lua/plenary.nvim',
    config = function()
      require('layers.ide.tsitter.todo').config()
    end,
  },

  ----------------------------------------------------------------------------------------------
  -- AUTO PAIRS
  -- not quite treesitter thing, but it uses treesitter, and fails if it's not installed
  {
    'windwp/nvim-autopairs', -- https://github.com/windwp/nvim-autopairs

    requires = {
      'nvim-treesitter/nvim-treesitter',
    },

    config = function()
      local autopairs = require 'nvim-autopairs'

      autopairs.setup {
        check_ts = true,
        ts_config = {},
        disable_filetype = { 'TelescopePrompt' }, -- vim , json
      }

      -- -- XXX do this only for ruby
      autopairs.add_rules(require 'nvim-autopairs.rules.endwise-ruby')
      autopairs.add_rules(require 'nvim-autopairs.rules.endwise-lua')
    end,
  },
}

---- TODO: cleanup
---- return {
----   {
----     requires = {
----       -- 'nvim-treesitter/nvim-treesitter-refactor', https://github.com/nvim-treesitter/nvim-treesitter-refactor

----       'p00f/nvim-ts-rainbow', -- https://github.com/p00f/nvim-ts-rainbow
----     },
----   },
---- }
