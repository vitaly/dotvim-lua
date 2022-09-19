local fn = vim.fn

vim.cmd [[packadd packer.nvim]]

local packer = require 'packer'

local border = 'rounded'
packer.init({
  package_root = vim.fn.stdpath 'config' .. '/pack',

  profile = {
    enable = true,
    threshold = 0,
  },

  display = {
    open_fn = function()
      return require('packer.util').float { border = border }
    end,
    prompt_border = border,
  },
})

packer.reset()

require('plugins').load()

local compiled_path = fn.stdpath('config') .. '/plugin/packer_compiled.lua'
local compiled = 0 == fn.empty(fn.glob(compiled_path))

-- print(vim.inspect(_my))

if _my.packer.updated then
  print "packer sync"
  packer.sync()

elseif not _my.packer.compiled then
  print "packer compile"
  packer.compile()

end
