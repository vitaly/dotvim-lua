local fn = vim.fn


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

install('impatient', fn.stdpath('config')..'/pack/packer/start/impatient.nvim', 'https://github.com/lewis6991/impatient.nvim.git')
require('impatient')

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
    autocmd BufWritePost */my/plugins.lua silent PackerCompile
    autocmd BufWritePost */my/plugins/*.lua silent PackerCompile
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
