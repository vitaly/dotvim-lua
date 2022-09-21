-- print 'bootstrap'
local fn = vim.fn

--------------------------------------------------------------------------------
_my.packer = _my.packer or {}
_my.packer.ROOT =  _my.ROOT .. '/pack'
_my.packer.COMPILED = _my.ROOT .. '/plugin/packer_compiled.lua'

--------------------------------------------------------------------------------
-- ensure package is installed at the given location
-- @param { string } name - package name
-- @param { string } repo - git repository
-- @param { string } dir - 'start' or 'opt' (default 'start')
-- @returns { boolean } true if was just installed
--------------------------------------------------------------------------------
local function install(name, repo, dir)
  local path = _my.ROOT .. '/pack/packer/' .. (dir or 'start') .. '/' .. name
  -- local path = fn.stdpath('data') .. '/site/pack/packer/' .. (dir or 'start') .. '/' .. name
  -- print(path)
  if 0 == fn.empty(fn.glob(path)) then
    return false
  end

  -- print('installing ' .. name .. '...')
  fn.system { 'git', 'clone', '--depth', '1', repo, path }
  print(name .. ' installed at ' .. path)

  return true
end

--------------------------------------------------------------------------------
-- IMPATIENT.NVIM: https://github.com/lewis6991/impatient.nvim
-- caching for bertter performance
install('impatient.nvim', 'https://github.com/lewis6991/impatient.nvim.git')
vim.cmd [[packadd impatient.nvim]]
if  _my.config.profile_impatient then
  require('impatient').enable_profile()
else
  require('impatient')
end

--------------------------------------------------------------------------------
-- PLENARY.NVIM: https://github.com/nvim-lua/plenary.nvim
-- we need this for `RELOAD` implementation in 'init.tools'
install('plenary.nvim', 'https://github.com/nvim-lua/plenary.nvim.git')
vim.cmd [[packadd plenary.nvim]]

--------------------------------------------------------------------------------
-- PACKER.NVIM
-- we note if we just installed it, so that we can sync the config later in the process
_G._my.packer.updated = install('packer.nvim', 'https://github.com/wbthomason/packer.nvim', 'opt')


-- TODO: detect packer config changes
-- TODO: clear impatiant cache before reloading?
