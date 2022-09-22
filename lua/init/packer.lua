-- just copied those form the packer sources with the following changes:
-- * we load 'plugins' instead of 'packer' so that it gets initialized
-- * we load 'init/packer/complete' instead of 'packer' and 'packer.snapshot' for the same purpose
--   'init/packer/complete' loads 'plugins', and returns packer's completion functions and 'packer.snapshot' as a field to access snapshot completions as well
vim.cmd [[command! -nargs=+       -complete=customlist,v:lua.require'init.packer.complete'.snapshot.completion.create   PackerSnapshot          lua require('init.plugins').snapshot(<f-args>)                ]]
vim.cmd [[command! -nargs=+       -complete=customlist,v:lua.require'init.packer.complete'.snapshot.completion.rollback PackerSnapshotRollback  lua require('init.plugins').rollback(<f-args>)                ]]
vim.cmd [[command! -nargs=+       -complete=customlist,v:lua.require'init.packer.complete'.snapshot.completion.snapshot PackerSnapshotDelete    lua require('init.plugins.snapshot').delete(<f-args>)         ]]
vim.cmd [[command! -nargs=*       -complete=customlist,v:lua.require'init.packer.complete'.plugin_complete              PackerInstall           lua require('init.plugins').install(<f-args>)                 ]]
vim.cmd [[command! -nargs=*       -complete=customlist,v:lua.require'init.packer.complete'.plugin_complete              PackerUpdate            lua require('init.plugins').update(<f-args>)                  ]]
vim.cmd [[command! -nargs=*       -complete=customlist,v:lua.require'init.packer.complete'.plugin_complete              PackerSync              lua require('init.plugins').sync(<f-args>)                    ]]
vim.cmd [[command!                                                                                                      PackerClean             lua require('init.plugins').clean()                           ]]
vim.cmd [[command! -nargs=*                                                                                             PackerCompile           lua require('init.plugins').compile(<q-args>)                 ]]
vim.cmd [[command!                                                                                                      PackerStatus            lua require('init.plugins').status()                          ]]
vim.cmd [[command!                                                                                                      PackerProfile           lua require('init.plugins').profile_output()                  ]]
vim.cmd [[command! -bang -nargs=+ -complete=customlist,v:lua.require'init.packer.complete'.loader_complete              PackerLoad              lua require('init.plugins').loader(<f-args>, '<bang>' == '!') ]]

if _my.packer.updated then
  -- packer was just initially installed
  require('init.plugins').sync()

elseif "" == vim.fn.glob(_my.packer.COMPILED) then
  -- can't find the compiled file
  require('init.plugins').compile()

end
