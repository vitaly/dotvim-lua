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

  json = {
    { cmd = { 'npx prettier --write' } },
  },

  javascript = {
    { cmd = { 'npx prettier --write' } },
  },

  typescript = {
    { cmd = { 'npx prettier --write' } },
  },
}
