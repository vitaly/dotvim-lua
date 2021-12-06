local dap = require 'dap'

local open_log = function()
  vim.cmd('e ' .. vim.fn.stdpath 'cache' .. '/dap.log')
end

local which_key = require 'which-key'
which_key.register {
  ['<F8>'] = { dap.continue, 'Continue' },
  ['<F10>'] = { dap.step_over, 'Step Over' },
  ['<F11>'] = { dap.step_into, 'Step Into' },
  ['<S-F11>'] = { dap.step_out, 'Step Out' },

  ['<localleader>'] = {
    b = { dap.toggle_breakpoint, 'Toggle Breakpoint' },

    ['@'] = { dap.run_last, 'Run Last' },
    ['<cr>'] = { dap.continue, 'Continue' },
    [';'] = { dap.step_over, 'Step Over' },
    [':'] = { dap.step_into, 'Step Into' },
    ['.'] = { dap.run_to_cursor, 'Run to Cursor' },
    ['<up>'] = { dap.up, 'Up Frame' },
    ['<down>'] = { dap.down, 'Down Frame' },
  },

  ['<leader>d'] = {

    b = { dap.toggle_breakpoint, 'Toggle Breakpoint' },

    ['@'] = { dap.run_last, 'Run Last' },
    ['<cr>'] = { dap.continue, 'Continue' },
    [';'] = { dap.step_over, 'Step Over' },
    [':'] = { dap.step_into, 'Step Into' },
    ['.'] = { dap.run_to_cursor, 'Run to Cursor' },
    ['<up>'] = { dap.up, 'Up Frame' },
    ['<down>'] = { dap.down, 'Down Frame' },

    r = { dap.run, 'Run' },
    x = { dap.terminate, 'Terminate' },

    L = { open_log, 'Open Log' },

    l = {
      name = 'List',
      c = { '<cmd>Telescope dap commands<cr>', 'Commands' },
      C = { '<cmd>Telescope dap configurations<cr>', 'Configurations' },
      v = { '<cmd>Telescope dap variables<cr>', 'Variables' },
      f = { '<cmd>Telescope dap frames<cr>', 'Frames' },
      b = { '<cmd>Telescope dap list_breakpoints<cr>', 'Breakpoints' },
    },
  },
}
