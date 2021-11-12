print 'my.plugins'
vim.cmd "packadd packer.nvim"

local packer = nil
if packer == nil then
  packer = require 'packer'
  packer.init {
    package_root = vim.fn.stdpath('config') .. '/pack',
    disable_commands = true
  }
end

packer.reset()

local use = packer.use
local function plugin(name)
  require(name)(use)
end

use { 'wbthomason/packer.nvim', opt = true }
use { 'tjdevries/astronauta.nvim' }
use { 'lewis6991/impatient.nvim' }

plugin('my.plugins.which-key')

--------------------------------------------------------------------------------
--'forward' packer actions
--------------------------------------------------------------------------------
local M = {}

function M.compile()
  packer.compile()
  return M
end

function M.install()
  packer.install()
  return M
end

function M.status()
  packer.status()
  return M
end

function M.sync()
  packer.sync()
  return M
end

function M.update()
  packer.update()
  return M
end

function M.clean()
  packer.clean()
  return M
end


return M
