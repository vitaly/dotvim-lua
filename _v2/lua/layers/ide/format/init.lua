-- lua/layers/ide/autoformat.lua

-- TODO: move to lsp.init
return {
  -- disable = true,

  config = function()
    require('layers.ide.format.config').setup {
      debug = false,
      settings = {

        -- type = {
        --   -- will set 'only' to cycle[1]
        --   cycle = { 'option1', 'option2' },
        --   -- this takes priority
        --   only = { 'only' },
        --   -- only used if cycle/only not present
        --   exclude = { 'exclude' },
        -- },

        -- TODO: move upstack. pass opts from top init.lua
        ruby = {
          async = true,
        },

        lua = {
          cycle = {
            'null-ls',
            'lua_ls',
          },
        },

        typescript = {
          cycle = {
            'null-ls',
            'tsserver',
          },
        },
      },
    }
    require('layers.ide.format.maps').setup()
  end,
}

-- TODO: clean
-- config ----------------------------------------------------------------------
-- require('format').setup {
--   vim = {
--     {
--       cmd = { 'stylua' },
--       start_pattern = '^lua << LUA$',
--       end_pattern = '^LUA$',
--     },
--   },

--   lua = {
--     {
--       cmd = { 'stylua --search-parent-directories' },
--     },
--   },

--   json = {
--     { cmd = { 'npx prettier --write' } },
--   },

--   javascript = {
--     { cmd = { 'npx prettier --write' } },
--   },

--   typescript = {
--     { cmd = { 'npx prettier --write' } },
--   },
-- }
