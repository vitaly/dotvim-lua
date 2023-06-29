-- lua/layers/ide/tsitter/init.lua

local layer = my.layer

return {
  -------------------------------------------------------------------------------------------------------------
  -------------------------------------------------------------------------------------------------------------
  -- TREESITTER
  layer 'ide.tsitter.core',

  -------------------------------------------------------------------------------------------------------------
  -- CONTEXT
  -- this plugin shows a bit of context at the top of the file, e.g. what class / function we are currently in.
  layer 'ide.tsitter.context',
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
