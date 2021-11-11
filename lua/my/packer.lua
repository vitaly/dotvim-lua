
--------------------------------------------------------------------------------
-- setup packer commands
--------------------------------------------------------------------------------
vim.cmd "command! PackerCompile lua require('my.plugins').compile()"
vim.cmd "command! PackerInstall lua require('my.plugins').install()"
vim.cmd "command! PackerStatus  lua require('my.plugins').status()"
vim.cmd "command! PackerSync    lua require('my.plugins').sync()"
vim.cmd "command! PackerUpdate  lua require('my.plugins').update()"

local fn = vim.fn
local install_path = fn.stdpath('config')..'/pack/packer/opt/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  print "installing packer.."
  fn.system({'git', 'clone', '--depth', '10', 'https://github.com/wbthomason/packer.nvim', install_path})
  print('packer installed at ' .. install_path)
  require('my.plugins').sync()
end

vim.cmd([[
  augroup packer_plugins
    autocmd!
    autocmd BufWritePost plugins.lua PackerSync
  augroup end
]])
