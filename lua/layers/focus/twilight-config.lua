-- lua/layers/focus/twilight-config.lua

-- config ----------------------------------------------------------------------
require('twilight').setup {
  dimming = {
    --   alpha = 0.25, -- amount of dimming
    alpha = 0.4,
    --   -- we try to get the foreground from the highlight groups or fallback color
    --   color = { 'Normal', '#ffffff' },
    --   inactive = false, -- when true, other windows will be fully dimmed (unless they contain the same buffer)
    inactive = true,
  },
  -- context = 10, -- amount of lines we will try to show around the current line
  context = 25,
  -- treesitter = true, -- use treesitter when available for the filetype
  -- -- treesitter is used to automatically expand the visible text,
  -- -- but you can further control the types of nodes that should always be fully expanded
  -- expand = { -- for treesitter, we we always try to expand to the top-most ancestor with these types
  --   'function',
  --   'method',
  --   'table',
  --   'if_statement',
  -- },
  -- exclude = {}, -- exclude these filetypes
}

-- keymaps ---------------------------------------------------------------------
require('which-key').register {
  ['\\'] = {
    f = { '<cmd>Twilight<cr>', 'Focus (Twilight)' },
  },
}
