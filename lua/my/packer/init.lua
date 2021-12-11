vim.cmd 'packadd packer.nvim'

local packer = nil
if packer == nil then
  packer = require 'packer'
  packer.init {
    package_root = vim.fn.stdpath 'config' .. '/pack',
    disable_commands = true,
    -- profile = {
    --   enable = true,
    --   threshold = 1,
    -- },
  }
end

packer.reset()

local m = {}

m.use = packer.use

for _, f in ipairs { 'compile', 'sync' } do
  m[f] = function()
    packer[f]()
    return m
  end
end

for _, f in ipairs { 'status', 'install', 'update', 'clean' } do
  m[f] = function()
    packer[f]()
    return m
  end
end

m.refresh = function()
  if vim.b.packer_ignore then
    vim.b.packer_ignore = false
  else
    packer.install()
  end
end

return m
