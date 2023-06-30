-- my.log.debug 'loading init.config'
-- give priority to currently active config
-- this is to that this file can be reloaded without loosing
-- transient user changes
my.config = vim.tbl_deep_extend('keep', my.config or {}, {

  tagbar = {
    'outline',
    -- 'sidevar',
    -- 'vista',
    side = 'left',
  },

  obsidian = {
    dir = '~/Obsidian/Main',
  },
})
