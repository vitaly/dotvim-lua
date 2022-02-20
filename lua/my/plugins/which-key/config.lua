-- https://github.com/folke/which-key.nvim

-- setup -----------------------------------------------------------------------
vim.opt.timeoutlen = 500 -- 0.5s before keymap menu
local which_key = require 'which-key'
which_key.setup {
  -- plugins = {
  --   marks = true, -- shows a list of your marks on ' and `
  --   registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
  --   spelling = {
  --     enabled = false, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
  --     suggestions = 20, -- how many suggestions should be shown in the list?
  --   },
  --   -- the presets plugin, adds help for a bunch of default keybindings in Neovim
  --   -- No actual key bindings are created
  --   presets = {
  --     operators = true, -- adds help for operators like d, y, ... and registers them for motion / text object completion
  --     motions = true, -- adds help for motions
  --     text_objects = true, -- help for text objects triggered after entering an operator
  --     windows = true, -- default bindings on <c-w>
  --     nav = true, -- misc bindings to work with windows
  --     z = true, -- bindings for folds, spelling and others prefixed with z
  --     g = true, -- bindings for prefixed with g
  --   },
  -- },
  -- -- add operators that will trigger motion and text object completion
  -- -- to enable all native operators, set the preset / operators plugin above
  -- operators = { gc = 'Comments' },
  key_labels = {
    -- -- override the label used to display some keys. It doesn't effect WK in any other way.
    -- -- For example:
    -- -- ["<space>"] = "SPC",
    -- -- ["<cr>"] = "RET",
    -- -- ["<tab>"] = "TAB",
    ['<space>'] = 'SPC',
    ['<cr>'] = 'RET',
    ['<tab>'] = 'TAB',
  },
  -- icons = {
  --   breadcrumb = '»', -- symbol used in the command line area that shows your active key combo
  --   separator = '➜', -- symbol used between a key and it's label
  --   group = '+', -- symbol prepended to a group
  -- },
  -- popup_mappings = {
  --   scroll_down = '<c-d>', -- binding to scroll down inside the popup
  --   scroll_up = '<c-u>', -- binding to scroll up inside the popup
  -- },
  window = {
    --   border = 'none', -- none, single, double, shadow
    border = 'single',
    --   position = 'bottom', -- bottom, top
    --   margin = { 1, 0, 1, 0 }, -- extra window margin [top, right, bottom, left]
    --   padding = { 2, 2, 2, 2 }, -- extra window padding [top, right, bottom, left]
    --   winblend = 0,
  },
  -- layout = {
  --   height = { min = 4, max = 25 }, -- min and max height of the columns
  --   width = { min = 20, max = 50 }, -- min and max width of the columns
  --   spacing = 3, -- spacing between columns
  --   align = 'left', -- align columns left, center or right
  -- },
  -- ignore_missing = false, -- enable this to hide mappings for which you didn't specify a label
  -- hidden = { '<silent>', '<cmd>', '<Cmd>', '<CR>', 'call', 'lua', '^:', '^ ' }, -- hide mapping boilerplate
  hidden = { '<silent>', '<cmd>', '<Cmd>', '<cr>', '<CR>', 'call ', 'lua ', '<C-U>', '^:', '^ ', '<Plug>' },
  -- show_help = true, -- show help message on the command line when the popup is visible
  -- triggers = 'auto', -- automatically setup triggers
  -- -- triggers = {"<leader>"} -- or specify a list manually
  -- triggers_blacklist = {
  --   -- list of mode / prefixes that should never be hooked by WhichKey
  --   -- this is mostly relevant for key maps that start with a native binding
  --   -- most people should not need to change this
  --   i = { 'j', 'k' },
  --   v = { 'j', 'k' },
  -- },
}

-- toggle ----------------------------------------------------------------------

require 'my.toggle'

local toggle_concealcursor = MAKE_TOGGLE { states = { 'n', '' }, o = 'concealcursor', set = REDRAW }
local toggle_conceallevel = MAKE_TOGGLE { states = { 0, 1, 2 }, o = 'conceallevel', set = REDRAW }
local toggle_clipboard = MAKE_TOGGLE { states = { 'unnamedplus', '' }, o = 'clipboard', set = REDRAW }

local function toggle_verboselog()
  if vim.o.verbose == 0 then
    vim.o.verbose = 9
    vim.o.verbosefile = './vim.log'
    print('verbose on into "' .. vim.o.verbosefile .. '"')
  else
    vim.o.verbose = 0
    vim.o.verbosefile = ''
    print 'verbose off'
  end
  REDRAW()
end

-- n keymap --------------------------------------------------------------------
which_key.register({

  ['<leader>'] = {
    name = 'SPC',

    [';'] = { '<plug>Toggle(comment)', 'Toggle Comment' },
    a = {
      name = 'App',
      p = { name = 'Packer' },
    },
    b = { name = 'Buffer' },
    f = {
      name = 'File',
      e = {
        name = 'Edit',
      },
      t = { name = 'Toggle' },
    },
    g = { name = 'Git' },
    t = { name = 'Tab' },
    v = { name = 'Vim' },
    w = { name = 'Window' },
    Y = { name = 'Yank' },
    d = { name = 'Debug' },
  },

  ['<localleader>'] = {
    name = ',',

    e = {
      name = 'Eval',
    },
  },

  g = {
    c = {
      name = 'Comment',
      c = 'Toggle Comment',
    },
  },

  -- toggles
  ['\\'] = {
    name = 'Toggle',

    d = {
      name = 'Debug',
    },

    n = {
      name = 'Conceal',
      c = { toggle_concealcursor, 'Cursor' },
      n = { toggle_conceallevel, 'Level' },
    },

    l = { toggle_verboselog, 'Verbose Log' },
    w = { '<cmd>set nolist!<cr>', 'White Space' },
    r = { '<cmd>set relativenumber!<cr>', 'Relative Number' },
    s = { '<cmd>setlocal spell!<cr>', 'Spell Check' },
    o = { '<cmd>set ro!<cr>', 'Read Only' },
    c = { toggle_clipboard, 'clipboard' },
  },
}, { mode = 'n' })

-- x keymap --------------------------------------------------------------------
which_key.register({
  g = {
    -- XXX: this doesn't work. it adds a duplicate in the menu
    c = 'Toggle Comment',
  },

  ['<leader>'] = {
    [';'] = { '<plug>Toggle(comment)', 'Toggle Comment' },
  },
}, { mode = 'x' })
