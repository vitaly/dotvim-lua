local which_key = require 'which-key'

print 'key toggle'

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

local which_key = require 'which-key'

which_key.register {
  ['<leader>T'] = {
    c = {
      name = 'Conceal',
      c = { toggle_concealcursor, 'Cursor' },
      l = { toggle_conceallevel, 'Level' },
    },

    v = { toggle_verboselog, 'Verbose Log' },
    w = { '<cmd>set nolist!<cr>', 'White Space' },
    r = { '<cmd>set relativenumber!<cr>', 'Relative Number' },
    s = { '<cmd>setlocal spell!<cr>', 'Spell Check' },
    R = { '<cmd>set ro!<cr>', 'Read Only' },
    C = { toggle_clipboard, 'clipboard' },
  },
}
