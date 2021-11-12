local fn = vim.fn

pcall(require, 'impatient')

--------------------------------------------------------------------------------
-- ensure package is installed at the given location
-- @param { string } name - package name
-- @param { string } path - path to install
-- @param { string } repo - git repository
-- @returns { boolean } true if was just installed
--------------------------------------------------------------------------------
local function install(name, path, repo)
  if 0 == fn.empty(fn.glob(path)) then
    return false
  end

  print("installing " .. name .. "...")
  fn.system({'git', 'clone', '--depth', '1', repo, path})
  print(name .. ' installed at ' .. path)

  return true
end

install('vimpeccable', fn.stdpath('config')..'/pack/packer/start/vimpeccable', 'https://github.com/svermeulen/vimpeccable')

if install('packer', fn.stdpath('config')..'/pack/packer/opt/packer.nvim', 'https://github.com/wbthomason/packer.nvim') then
  require('my.plugins').sync()
end

--------------------------------------------------------------------------------
-- sync packer if plugins.lua changes
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
