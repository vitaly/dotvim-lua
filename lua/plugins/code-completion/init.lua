---@module 'onion.config'
local config = require('onion.config')
config.set_defaults('code-completion', { backend = 'plugins.code-completion.blink' }) -- 'blink' or 'cmp'

return {
  { import = config.get('code-completion.backend') },
}
