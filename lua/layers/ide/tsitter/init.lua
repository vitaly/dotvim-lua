


return {
  {
    'nvim-treesitter/nvim-treesitter', -- https://github.com/nvim-treesitter/nvim-treesitter

    -- FIXME: this doesn't work for some reason
    -- the plugin/nvim-treesitter.lua is not being loaded for some reason
    -- run = ':TSUpdate',


    requires = {
      'nvim-treesitter/playground', -- https://github.com/nvim-treesitter/playground
    },



    config = function()
      require('layers.ide.tsitter.config').setup()
    end,
  },


  -------------------------------------------------------------------------------------------------------------
  -- this plugin shows a bit of context at the top of the file, e.g. what class / function we are currently in.
  {
    'romgrk/nvim-treesitter-context', -- https://github.com/romgrk/nvim-treesitter-context
    config = function()
      require 'layers.ide.tsitter.context'
    end,
  },



   {
     'folke/todo-comments.nvim', -- https://github.com/folke/todo-comments.nvim
     -- 'vitaly/todo-comments.nvim',
     requires = 'nvim-lua/plenary.nvim',
     config = function()
       require('layers.ide.tsitter.todo').setup()
     end,
   },
}

---- TODO: cleanup
---- return {
----   {
----     requires = {
----       -- 'nvim-treesitter/nvim-treesitter-refactor', https://github.com/nvim-treesitter/nvim-treesitter-refactor

----       'nvim-treesitter/nvim-treesitter-textobjects', -- https://github.com/nvim-treesitter/nvim-treesitter-textobjects
----       'JoosepAlviste/nvim-ts-context-commentstring', -- https://github.com/JoosepAlviste/nvim-ts-context-commentstring
----       'p00f/nvim-ts-rainbow', -- https://github.com/p00f/nvim-ts-rainbow
----     },
----
----     config = function()
----       require 'my.plugins.treesitter.config'
----     end,
----   },
---- }
