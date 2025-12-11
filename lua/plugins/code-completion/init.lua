---@module 'onion.config'
local config = require('onion.config')
config.set_defaults('code-completion', { backend = 'plugins.code-completion.blink' }) -- 'blink' or 'cmp'

return {
  {
    'folke/lazydev.nvim', -- https://github.com/folke/lazydev.nvim
    ft = 'lua',
    opts = {
      library = {
        -- Load luvit types when the `vim.uv` word is found
        { path = '${3rd}/luv/library', words = { 'vim%.uv' } },
      },
    },
  },

  { import = config.get('code-completion.backend') },
}
