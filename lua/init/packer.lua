local fn = vim.fn

vim.cmd [[packadd packer.nvim]]

local packer = require 'packer'

packer.startup({
  function(use)
    use { 'wbthomason/packer.nvim', opt = true }

    use 'lewis6991/impatient.nvim' -- https://github.com/lewis6991/impatient.nvim
    use 'nvim-lua/plenary.nvim' -- https://github.com/nvim-lua/plenary.nvim

    use 'folke/which-key.nvim' -- https://github.com/folke/which-key.nvim
  end,
  config = {
    package_root = vim.fn.stdpath 'config' .. '/pack',

  },
})

local compiled_path = fn.stdpath('config') .. '/plugin/packer_compiled.lua'
local compiled = 0 == fn.empty(fn.glob(compiled_path))

print(vim.inspect(_my))

if _my.packer.updated then
  print "packer sync"
  packer.sync()

elseif not _my.packer.compiled then
  print "packer compile"
  packer.compile()

end
