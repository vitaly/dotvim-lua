-- print 'bootstrap'
local fn = vim.fn

--------------------------------------------------------------------------------
-- global state for _my configuration
_G._my = _G._my or {}
_G._my.packer = _G._my.packer or {}

--------------------------------------------------------------------------------
-- ensure package is installed at the given location
-- @param { string } name - package name
-- @param { string } repo - git repository
-- @param { string } dir - 'start' or 'opt' (default 'start')
-- @returns { boolean } true if was just installed
--------------------------------------------------------------------------------
local function install(name, repo, dir)
  local path = fn.stdpath('config') .. '/pack/packer/' .. (dir or 'start') .. '/' .. name
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
require 'impatient'

--------------------------------------------------------------------------------
-- PLENARY.NVIM: https://github.com/nvim-lua/plenary.nvim
-- we need this for `RELOAD` implementation in 'init.tools'
install('plenary.nvim', 'https://github.com/nvim-lua/plenary.nvim.git')
vim.cmd [[packadd plenary.nvim]]

--------------------------------------------------------------------------------
-- PACKER.NVIM
_G._my.packer.updated = install('packer.nvim', 'https://github.com/wbthomason/packer.nvim', 'opt')

