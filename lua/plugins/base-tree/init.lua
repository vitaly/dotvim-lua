local config = require('onion.config')
config.set_defaults('file-tree', {
  plugin = 'neotree',

  position = 'left',
})

if config.get('file-tree.plugin') == 'nvimtree' then
  return require('plugins.base-tree.filer-nvimtree')
else
  return require('plugins.base-tree.filer-neotree')
end
