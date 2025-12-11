local config = require('onion.config')
local tools = require('lib.tools')

config.set_defaults('file-tree', { backend = 'plugins.file-tree.snacks', position = 'left' }) -- snacks, neotree, or nvimtree

local glue = require('glue').register('file-tree')
local function _map(event)
  return function() return glue.call(event) end
end

return tools.vplug({
  'plugins.file-tree',

  dependencies = { require(config.get('file-tree.backend')) },

  keys = {
    { '\\\\', _map('file-tree.actions.popup'), desc = 'File Tree Popup' },
    { '\\[', _map('file-tree.actions.toggle'), desc = 'File Tree Toggle' },
    { '\\.', _map('file-tree.actions.reveal'), desc = 'File Tree Reveal' },
  },
})
