local fn = vim.fn


--------------------------------------------------------------------------------
-- ensure package is installed at the given location
-- @param { string } name - package name
-- @param { string } path - path to install
-- @param { string } repo - git repository
-- @returns { boolean } true if was just installed
--------------------------------------------------------------------------------
local function install(name, repo, dir)
  local path = fn.stdpath('config')..'/pack/packer/'..(dir or 'start')..'/'..name
  if 0 == fn.empty(fn.glob(path)) then
    return false
  end

  print("installing " .. name .. "...")
  fn.system({'git', 'clone', '--depth', '1', repo, path})
  print(name .. ' installed at ' .. path)

  return true
end

install('impatient.nvim', 'https://github.com/lewis6991/impatient.nvim.git')
vim.cmd [[packadd impatient.nvim]]
require('impatient')

install('plenary.nvim', 'https://github.com/nvim-lua/plenary.nvim.git')


install('vimpeccable', 'https://github.com/svermeulen/vimpeccable')

if install('packer.nvim', 'https://github.com/wbthomason/packer.nvim', 'opt') then
  require('my.plugins').sync()
end

--------------------------------------------------------------------------------
-- sync packer if plugins.lua changes
--------------------------------------------------------------------------------
vim.cmd([[
  augroup packer_plugins
    autocmd!
    autocmd BufWritePost */my/plugins.lua PackerCompile
    autocmd BufWritePost */my/plugins/*.lua PackerCompile
    autocmd User PackerCompileDone checktime
  augroup end
]])

--------------------------------------------------------------------------------
-- setup packer commands
--------------------------------------------------------------------------------
vim.cmd "command! PackerCompile lua REQUIRE('my.plugins').compile()"
vim.cmd "command! PackerInstall lua REQUIRE('my.plugins').install()"
vim.cmd "command! PackerStatus  lua REQUIRE('my.plugins').status()"
vim.cmd "command! PackerSync    lua REQUIRE('my.plugins').sync()"
vim.cmd "command! PackerUpdate  lua REQUIRE('my.plugins').update()"
vim.cmd "command! PackerClean   lua REQUIRE('my.plugins').clean()"
