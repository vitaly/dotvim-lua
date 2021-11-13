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


for _,f in ipairs({ 'compile', 'install', 'status', 'sync', 'update', 'clean' }) do
  m[f] = function()
    -- print('removing all mappings')
    require('vimp').unmap_all()
    packer.compile()
    return m
  end
end

return m
