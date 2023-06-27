local function cmd(name, command, opts)
  vim.api.nvim_create_user_command(name, command, opts or {})
end

local function setup_commands()
  cmd('X', 'x')
  cmd('Q', 'q')
  cmd('Qa', 'qa')
  cmd('QA', 'qa')
  cmd('E', 'e', { nargs = '*', complete = 'file' })
  cmd('W', 'w', { nargs = '*', complete = 'file' })
end

require('lib.au').command('setup.commands', 'User', function()
  setup_commands()
end, { pattern = 'VeryLazy' })
