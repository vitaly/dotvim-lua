local config = require('onion.config')
config.set_defaults('file-tree', { backend = 'snacks', position = 'left' })

return require('plugins.file-tree.' .. config.get('file-tree.backend'))
