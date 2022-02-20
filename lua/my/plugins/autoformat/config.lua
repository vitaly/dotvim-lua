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
local function toggle_autoformat()
    if vim.b.autoformat == 1 then
        print 'autoformat off'
        vim.cmd [[AutoFormatOff]]
    else
        print 'autoformat on'
        vim.cmd [[AutoFormatOn]]
    end
end

require 'my.toggle'

local toggle_format_debug = MAKE_TOGGLE {
  silent = true,
  g = 'format_debug',
  set = function(val)
      if val then
          vim.b.format_with_lsp = false
          vim.cmd [[AutoFormatOn]]
          vim.cmd [[w]]
      end
  end,
}

local toggle_autoformat_method = MAKE_TOGGLE {
  b = 'format_with_lsp',
  silent = true,
  states = { 0, 1 }, -- empty is treated as 1, so we default to 0 on toggle
  set = function(val)
      vim.cmd [[AutoFormatOn]]
      vim.cmd [[w]]
  end,
}

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
