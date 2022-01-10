vim.opt.timeoutlen = 500 -- 0.5s before keymap menu

local which_key = require 'which-key'
which_key.setup {
  hidden = { '<silent>', '<cmd>', '<Cmd>', '<cr>', '<CR>', 'call ', 'lua ', '<C-U>', '^:', '^ ', '<Plug>' }, -- hide mapping boilerplate
}

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
    T = { name = 'Toggle' },
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
}, { mode = 'n' })

which_key.register({
  g = {
    c = 'Toggle Comment',
  },
  ['<leader>'] = {
    [';'] = { '<plug>Toggle(comment)', 'Toggle Comment' },
  },
}, { mode = 'x' })
