local fn = vim.fn

--------------------------------------------------------------------------------
-- ensure package is installed at the given location
-- @param { string } name - package name
-- @param { string } path - path to install
-- @param { string } repo - git repository
-- @returns { boolean } true if was just installed
--------------------------------------------------------------------------------
local function install(name, repo, dir)
  local path = fn.stdpath 'config' .. '/pack/packer/' .. (dir or 'start') .. '/' .. name
  if 0 == fn.empty(fn.glob(path)) then
    return false
  end

  print('installing ' .. name .. '...')
  fn.system { 'git', 'clone', '--depth', '1', repo, path }
  print(name .. ' installed at ' .. path)

  return true
end

install('impatient.nvim', 'https://github.com/lewis6991/impatient.nvim.git')
vim.cmd [[packadd impatient.nvim]]
require 'impatient'

install('plenary.nvim', 'https://github.com/nvim-lua/plenary.nvim.git')

install('vimpeccable', 'https://github.com/svermeulen/vimpeccable')

install('which-key.nvim', 'https://github.com/folke/which-key.nvim')

if install('packer.nvim', 'https://github.com/wbthomason/packer.nvim', 'opt') then
  require('my.packer').sync()
end

--------------------------------------------------------------------------------
-- sync packer if plugins.lua changes
--------------------------------------------------------------------------------
vim.cmd [[
  augroup packer_plugins
    autocmd!
    autocmd BufWritePost */my/plugins.lua PackerRefresh
    autocmd BufWritePost */my/plugins/*.lua PackerRefresh
    autocmd User PackerComplete PackerCompile
    autocmd User PackerCompileDone checktime
  augroup end
]]

--------------------------------------------------------------------------------
-- setup packer commands
--------------------------------------------------------------------------------
vim.cmd "command! PackerRefresh lua REQUIRE('my.plugins').refresh()"

-- copied from packer.nvim replacing require 'packer' with 'my.packer'
vim.cmd [[packadd packer.nvim | command! -nargs=* -complete=customlist,v:lua.require'my.packer'.plugin_complete  PackerInstall    lua require('my.packer').install(<f-args>)]]
vim.cmd [[packadd packer.nvim | command! -nargs=* -complete=customlist,v:lua.require'my.packer'.plugin_complete PackerUpdate      lua require('my.packer').update(<f-args>)]]
vim.cmd [[packadd packer.nvim | command! -nargs=* -complete=customlist,v:lua.require'my.packer'.plugin_complete PackerSync        lua require('my.packer').sync(<f-args>)]]
vim.cmd [[packadd packer.nvim | command! PackerClean                                                                              lua require('my.packer').clean()]]
vim.cmd [[packadd packer.nvim | command! -nargs=* PackerCompile                                                                   lua require('my.packer').compile(<q-args>)]]
vim.cmd [[packadd packer.nvim | command! PackerStatus                                                                             lua require('my.packer').status()]]
vim.cmd [[packadd packer.nvim | command! PackerProfile                                                                            lua require('my.packer').profile_output()]]
vim.cmd [[packadd packer.nvim | command! -bang -nargs=+ -complete=customlist,v:lua.require'my.packer'.loader_complete PackerLoad  lua require('my.packer').loader(<f-args>, '<bang>' == '!')]]
