local fn = vim.fn

pcall(require, 'impatient')

--------------------------------------------------------------------------------
-- install astronauta if needed
--------------------------------------------------------------------------------
local astro_path = fn.stdpath('config')..'/pack/packer/start/astronauta.nvim'
if fn.empty(fn.glob(astro_path)) > 0 then
  print "installing astronauta.."
  fn.system({'git', 'clone', '--depth', '1', 'https://github.com/tjdevries/astronauta.nvim.git', astro_path})
  print('astronauta installed at ' .. astro_path)
end

--------------------------------------------------------------------------------
--install packer if needed
--------------------------------------------------------------------------------
local packer_path = fn.stdpath('config')..'/pack/packer/opt/packer.nvim'
if fn.empty(fn.glob(packer_path)) > 0 then
  print "installing packer.."
  fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', packer_path})
  print('packer installed at ' .. packer_path)
  require('my.plugins').sync()
end

--------------------------------------------------------------------------------
-- pre-load astronauta
--------------------------------------------------------------------------------
vim.cmd [[runtime plugin/astronauta.vim]]

--------------------------------------------------------------------------------
--sync packer if plugins.lua changes
--------------------------------------------------------------------------------
vim.cmd([[
  augroup packer_plugins
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

--------------------------------------------------------------------------------
-- setup packer commands
--------------------------------------------------------------------------------
vim.cmd "command! PackerCompile lua require('my.plugins').compile()"
vim.cmd "command! PackerInstall lua require('my.plugins').install()"
vim.cmd "command! PackerStatus  lua require('my.plugins').status()"
vim.cmd "command! PackerSync    lua require('my.plugins').sync()"
vim.cmd "command! PackerUpdate  lua require('my.plugins').update()"
vim.cmd "command! PackerClean   lua require('my.plugins').clean()"
