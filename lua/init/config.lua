-- give priority to currently active config
-- this is to that this file can be reloaded without loosing
-- transient user changes
_my.config = vim.tbl_deep_extend('keep', _my.config or {}, {

  filer = {
    -- 'nvimtree',
    'neotree',

    side = 'right',
  },

  tagbar = {
    'outline',
    -- 'sidevar',
    -- 'vista',
    side = 'left',
  },

  statusline = {
    'lua_line',
    -- 'galaxy_line',
    -- 'incline',
  },

  sumneko_lua = {
    -- whether to pass whole runtime path to sumneko
    full_library = false,
  },
})