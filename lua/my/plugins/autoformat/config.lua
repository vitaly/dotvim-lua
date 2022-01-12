-- config ----------------------------------------------------------------------
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

-- toggle ----------------------------------------------------------------------
vim.g.format_debug = false
local function toggle_format_debug()
  if vim.g.format_debug then
    print 'format debug off'
    vim.g.format_debug = false
  else
    print 'format debug on'
    vim.g.format_debug = true
  end
end

local function toggle_autoformat()
  if vim.b.autoformat == 1 then
    print 'autoformat off'
    vim.cmd [[AutoFormatOff]]
  else
    print 'autoformat on'
    vim.cmd [[AutoFormatOn]]
  end
end

-- keymaps ---------------------------------------------------------------------
require('which-key').register {
  ['\\'] = {
    a = { toggle_autoformat, 'Autoformat' },
    da = { toggle_format_debug, 'Autoformat' },
  },
}
