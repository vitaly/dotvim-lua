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

require 'my.toggle'

-- toggle ----------------------------------------------------------------------
local function toggle_autoformat()
  if vim.b.autoformat == 1 then
    print 'autoformat off'
    vim.cmd [[AutoFormatOff]]
  else
    print 'autoformat on'
    vim.cmd [[AutoFormatOn]]
  end
end

local format_debug = MakeSwitch {
  g = 'format_debug',
  on = function(self, val)
    if val then
      vim.b.format_with_lsp = false
      vim.cmd [[AutoFormatOn]]
      vim.cmd [[w]]
    end
  end,
  silent = true,
}

local toggle_format_debug = format_debug.toggler

local format_method = MakeSwitch {
  b = 'format_with_lsp',
  states = { 0, 1 }, -- empty is treated as 1, so we default to 0 on toggle
  on = function(self, val)
    vim.cmd [[AutoFormatOn]]
    vim.cmd [[w]]
  end,
  silent = true,
}
local toggle_autoformat_method = format_method.toggler

-- keymaps ---------------------------------------------------------------------
require('which-key').register {
  ['\\'] = {
    a = {
      name = 'AutoFormat',
      a = { toggle_autoformat, 'Autoformat' },
      d = { toggle_format_debug, 'Debug' },
      ['\\'] = { toggle_autoformat_method, 'Method' },
    },
  },
}
