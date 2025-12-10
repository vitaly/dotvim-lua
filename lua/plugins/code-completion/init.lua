-- return require('plugins.code-completion.blink')
-- return require('plugins.code-completion.cmp')

return {
  { import = 'plugins.code-completion.blink' },
  -- { import = 'plugins.code-completion.cmp' },

  {
    'folke/lazydev.nvim', -- https://github.com/folke/lazydev.nvim
    ft = 'lua', -- only load on lua files
    opts = {
      library = {
        -- See the configuration section for more details
        -- Load luvit types when the `vim.uv` word is found
        { path = '${3rd}/luv/library', words = { 'vim%.uv' } },
      },
    },
  },
}
