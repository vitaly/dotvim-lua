-- lua/init/packer.lua

-- just copied those form the packer sources with the following changes:
-- * we load 'plugins' instead of 'packer' so that it gets initialized
-- * we load 'init/packer/complete' instead of 'packer' and 'packer.snapshot' for the same purpose
--   'init/packer/complete' loads 'plugins', and returns packer's completion functions and 'packer.snapshot' as a field to access snapshot completions as well
-- stylua: ignore start
vim.cmd [[command! -nargs=+       -complete=customlist,v:lua.require'init.packer.complete'.snapshot.completion.create   PackerSnapshot          lua REQUIRE('init.plugins').snapshot(<f-args>)                ]]
vim.cmd [[command! -nargs=+       -complete=customlist,v:lua.require'init.packer.complete'.snapshot.completion.rollback PackerSnapshotRollback  lua REQUIRE('init.plugins').rollback(<f-args>)                ]]
vim.cmd [[command! -nargs=+       -complete=customlist,v:lua.require'init.packer.complete'.snapshot.completion.snapshot PackerSnapshotDelete    lua REQUIRE('init.plugins.snapshot').delete(<f-args>)         ]]
vim.cmd [[command! -nargs=*       -complete=customlist,v:lua.require'init.packer.complete'.plugin_complete              PackerInstall           lua REQUIRE('init.plugins').install(<f-args>)                 ]]
vim.cmd [[command! -nargs=*       -complete=customlist,v:lua.require'init.packer.complete'.plugin_complete              PackerUpdate            lua REQUIRE('init.plugins').update(<f-args>)                  ]]
vim.cmd [[command! -nargs=*       -complete=customlist,v:lua.require'init.packer.complete'.plugin_complete              PackerSync              lua REQUIRE('init.plugins').sync(<f-args>)                    ]]
vim.cmd [[command!                                                                                                      PackerClean             lua REQUIRE('init.plugins').clean()                           ]]
vim.cmd [[command! -nargs=*                                                                                             PackerCompile           lua REQUIRE('init.plugins').compile(<q-args>)                 ]]
vim.cmd [[command!                                                                                                      PackerStatus            lua REQUIRE('init.plugins').status()                          ]]
vim.cmd [[command!                                                                                                      PackerProfile           lua REQUIRE('init.plugins').profile_output()                  ]]
vim.cmd [[command! -bang -nargs=+ -complete=customlist,v:lua.require'init.packer.complete'.loader_complete              PackerLoad              lua REQUIRE('init.plugins').loader(<f-args>, '<bang>' == '!') ]]
vim.cmd [[command!                                                                                                      PackerLog               exec 'e' stdpath('cache')  . '/packer.nvim.log'               ]]
-- stylua: ignore end

if _my.packer.updated then
  -- packer was just initially installed
  require('init.plugins').sync()
elseif '' == vim.fn.glob(_my.packer.COMPILED) then
  -- can't find the compiled file
  require('init.plugins').compile()
end

cmdbang('PackerRefresh', function()
  -- print 'refreshing...'
  vim.g.packer_refresh_in_progress = true
  RELOAD 'layers.'
  REQUIRE 'init.config'
  REQUIRE 'init.packer'
  REQUIRE('init.plugins').install()
end)

cmdbang('PackerAutoRefresh', function()
  if vim.g.packer_refresh_in_progress or vim.g.packer_refresh_disabled or vim.b.format_in_progress then
    return
  end
  vim.cmd [[PackerRefresh]]
end)

--------------------------------------------------------------------------------
-- sync packer if plugins.lua changes
--------------------------------------------------------------------------------
vim.cmd [[
  augroup packer_plugins
    autocmd!
    autocmd BufWritePost */init/plugins.lua,*/layers/*.lua PackerAutoRefresh
    autocmd User PackerComplete PackerCompile
    autocmd User PackerCompileDone checktime
    autocmd User PackerCompileDone let g:packer_refresh_in_progress = v:false
  augroup end
]]

--------------------------------------------------------------------------------
-- KEYMAPS
--------------------------------------------------------------------------------

local refresh_toggle = require('my.toggle').create {
  name = 'Disable Auto Refresh',
  g = 'packer_refresh_disabled',
}

require('which-key').register {
  ['<leader>'] = {
    r = { '<cmd>PackerRefresh<cr>', 'Refresh Packer' },
    ap = {
      name = 'Packer',

      s = { '<cmd>PackerStatus<cr>', 'Status' },
      c = { '<cmd>PackerCompile<cr>', 'Compile' },
      i = { '<cmd>PackerInstall<cr>', 'Install' },
      u = { '<cmd>PackerUpdate<cr>', 'Update' },
      p = { '<cmd>PackerProfile<cr>', 'Profile' },

      S = { '<cmd>PackerSync<cr>', 'Sync' },
      C = { '<cmd>PackerClean<cr>', 'Clean' },

      L = { '<cmd>PackerLog<cr>', 'Log!' },
    },

    ['sp'] = { '<cmd>PackerStatus<cr>', 'Packer' },
  },

  ['\\'] = {
    p = { refresh_toggle.toggler, 'Packer Refresh' },
  },
}
