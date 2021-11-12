print "vimx/init"

pcall(require, 'impatient')
require 'my.packer'
require 'my.builtins'
require 'my.options'

local g = vim.g
local cmd = vim.cmd
local o, wo, bo = vim.o, vim.wo, vim.bo
local fn = vim.fn



