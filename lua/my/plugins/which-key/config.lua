vim.opt.timeoutlen = 500 -- 0.5s before keymap menu

-- setup -----------------------------------------------------------------------
local which_key = require 'which-key'
which_key.setup {
  hidden = { '<silent>', '<cmd>', '<Cmd>', '<cr>', '<CR>', 'call ', 'lua ', '<C-U>', '^:', '^ ', '<Plug>' }, -- hide mapping boilerplate
}

-- toggle ----------------------------------------------------------------------
local function toggle_concealcursor()
  if vim.o.concealcursor == 'n' then
    vim.o.concealcursor = ''
  else
    vim.o.concealcursor = 'n'
  end
  vim.cmd [[redraw]]
end

local function toggle_conceallevel()
  if vim.o.conceallevel == 0 then
    vim.o.conceallevel = 2
  else
    vim.o.conceallevel = 0
  end
  vim.cmd [[redraw]]
end

local function toggle_clipboard()
  if vim.o.clipboard == 'unnamedplus' then
    vim.o.clipboard = ''
  else
    vim.o.clipboard = 'unnamedplus'
  end
  print('set clipboard to "' .. vim.o.clipboard .. '"')
  vim.cmd [[redraw]]
end

local function toggle_verboselog()
  if vim.o.verbose == 0 then
    vim.o.verbose = 9
    vim.o.verbosefile = './vim.log'
  else
    vim.o.verbose = 0
    vim.o.verbosefile = ''
  end
  print('set verbosefile to "' .. vim.o.verbosefile .. '"')
  vim.cmd [[redraw]]
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
      l = { toggle_conceallevel, 'Level' },
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
    c = 'Toggle Comment',
  },

  ['<leader>'] = {
    [';'] = { '<plug>Toggle(comment)', 'Toggle Comment' },
  },
}, { mode = 'x' })
