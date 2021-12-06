require('format').setup {

  vim = {
    {
      cmd = { 'stylua' },
      start_pattern = '^lua << LUA$',
      end_pattern = '^LUA$',
    },
  },

  lua = {
    {
      cmd = { 'stylua --search-parent-directories' },
    },
  },

  javascript = {
    { cmd = { 'npx prettier -w' } },
  },
}
