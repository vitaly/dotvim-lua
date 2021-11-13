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

local m = {}

m.use = packer.use

function m.plugin(name)
  REQUIRE(name)(packer.use)
end


for _,f in ipairs({ 'compile', 'sync' }) do
  m[f] = function()
    require('vimp').unmap_all()
    packer[f]()
    return m
  end
end

for _,f in ipairs({ 'status', 'install', 'update', 'clean' }) do
  m[f] = function()
    packer[f]()
    return m
  end
end


return m
