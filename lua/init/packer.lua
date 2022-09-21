-- just copied those form the packer sources, replacing require('packer') with require('plugins')
vim.cmd [[command! -nargs=+ -complete=customlist,v:lua.require'packer.snapshot'.completion.create PackerSnapshot  lua require('plugins').snapshot(<f-args>)]]
vim.cmd [[command! -nargs=+ -complete=customlist,v:lua.require'packer.snapshot'.completion.rollback PackerSnapshotRollback  lua require('plugins').rollback(<f-args>)]]
vim.cmd [[command! -nargs=+ -complete=customlist,v:lua.require'packer.snapshot'.completion.snapshot PackerSnapshotDelete lua require('plugins.snapshot').delete(<f-args>)]]
vim.cmd [[command! -nargs=* -complete=customlist,v:lua.require'packer'.plugin_complete PackerInstall lua require('plugins').install(<f-args>)]]
vim.cmd [[command! -nargs=* -complete=customlist,v:lua.require'packer'.plugin_complete PackerUpdate lua require('plugins').update(<f-args>)]]
vim.cmd [[command! -nargs=* -complete=customlist,v:lua.require'packer'.plugin_complete PackerSync lua require('plugins').sync(<f-args>)]]
vim.cmd [[command! PackerClean             lua require('plugins').clean()]]
vim.cmd [[command! -nargs=* PackerCompile  lua require('plugins').compile(<q-args>)]]
vim.cmd [[command! PackerStatus            lua require('plugins').status()]]
vim.cmd [[command! PackerProfile           lua require('plugins').profile_output()]]
vim.cmd [[command! -bang -nargs=+ -complete=customlist,v:lua.require'packer'.loader_complete PackerLoad lua require('plugins').loader(<f-args>, '<bang>' == '!')]]

if _my.packer.updated then
  -- packer was just initially installed
  require('plugins').sync()

elseif "" == vim.fn.glob(_my.packer.COMPILED) then
  -- can't find the compiled file
  require('plugins').compile()

end
