local config = require('onion.config')
local tools = require('lib.tools')

config.set_defaults('file-tree', { backend = 'plugins.file-tree.snacks', position = 'left' }) -- snacks, neotree, or nvimtree

local backend = config.get('file-tree.backend')

local glue_map = require('lib.glue').map

return tools.vplug({
  'plugins.file-tree',

  dependencies = { require(backend) },

  keys = {
    { '\\\\', glue_map('file-tree', 'file-tree.actions.popup'), desc = 'File Tree Popup' },
    { '\\[', glue_map('file-tree', 'file-tree.actions.toggle'), desc = 'File Tree Toggle' },
    { '\\.', glue_map('file-tree', 'file-tree.actions.reveal'), desc = 'File Tree Reveal' },
  },
})
