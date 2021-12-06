local toggle_breakpoint = function()
  require('dap').toggle_breakpoint()
end

local debug_continue = function()
  require('dap').continue()
end

local debug_step_over = function()
  require('dap').step_over()
end

local debug_step_into = function()
  require('dap').step_into()
end

local debug_step_out = function()
  require('dap').step_out()
end

local debug_run_last = function()
  require('dap').run_last()
end

-- local debug_repl_open = function()
--   require('dap').repl.open()
-- end

-- local debug_repl_close = function()
--   require('dap').repl.close()
-- end

local debug_repl_toggle = function()
  require('dap').repl.toggle()
end

local debug_run_to_cursor = function()
  require('dap').run_to_cursor()
end

local debug_run = function()
  require('dap').run()
end

local debug_terminate = function()
  require('dap').terminate()
end

local debug_list_breakpoints = function()
  require('dap').list_breakpoints()
end

local which_key = require 'which-key'
which_key.register {
  ['<leader>d'] = {
    b = { toggle_breakpoint, 'Toggle Breakpoint' },
    ['<space>'] = { toggle_breakpoint, 'Toggle Breakpoint' },
    ['<cr>'] = { debug_continue, 'Continue' },
    L = { debug_list_breakpoints, 'List Breakpoints' },

    o = { debug_step_over, 'Step Over' },
    [';'] = { debug_step_over, 'Step Over' },
    ['<right>'] = { debug_step_over, 'Step Over' },

    i = { debug_step_into, 'Step Into' },
    [':'] = { debug_step_into, 'Step Into' },
    ['<down>'] = { debug_step_into, 'Step Into' },

    O = { debug_step_out, 'Step Out' },
    ['<up>'] = { debug_step_out, 'Step Out' },

    l = { debug_run_last, 'Run Last' },

    R = { debug_repl_toggle, 'Toggle REPL' },

    x = { debug_terminate, 'Terminate' },
    ['<esc>'] = { debug_terminate, 'Terminate' },

    r = { debug_run, 'Run' },

    ['.'] = { debug_run_to_cursor, 'Run to Cursor' },
  },
  ['<leader>'] = {
    ['<right>'] = { debug_step_over, 'Step Over' },
    ['<down>'] = { debug_step_into, 'Step Into' },
    ['<up>'] = { debug_step_out, 'Step Out' },
  },
}
