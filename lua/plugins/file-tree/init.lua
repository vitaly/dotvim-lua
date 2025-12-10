local config = require('onion.config')
local tools = require('lib.tools')

config.set_defaults('file-tree', { plugin = 'snacks', position = 'left' })

local glue = require('glue').register('file-tree')
local function _map(event)
  return function() return glue.call(event) end
end

return tools.vplug({
  'plugins.file-tree',

  dependencies = {
    require('plugins.file-tree.' .. config.get('file-tree.plugin')),
  },

  keys = {
    { '\\\\', _map('file-tree.actions.popup'), desc = 'File Tree Popup' },
    { '\\[', _map('file-tree.actions.toggle'), desc = 'File Tree Toggle' },
    { '\\.', _map('file-tree.actions.reveal'), desc = 'File Tree Reveal' },
  },
})
