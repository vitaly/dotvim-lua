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

local use = packer.use
packer.reset()

use { 'wbthomason/packer.nvim', opt = true }
use 'lewis6991/impatient.nvim'

local M = {}

function M.compile()
  packer.compile()
  return M
end

function M.install()
  packer.install()
  return M
end

function M.sync()
  packer.sync()
  return M
end

return M
