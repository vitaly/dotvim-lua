local function cmd(name, command, opts)
  vim.api.nvim_create_user_command(name, command, opts or {})
end

--- Print matching dictionary entries from a given scope
---@param scope string 'g' for vim.g, 'b' for vim.b, 'v' for vim.v
---@param pattern string Vim regex pattern to match against keys
local function print_matching_dict_entries(scope, pattern)
  -- vim.g/vim.b/vim.v are not iterable as regular Lua tables
  -- We need to use vim.fn to get the keys from the underlying vim dictionaries
  local dict_expr
  if scope == 'g' then
    dict_expr = 'g:'
  elseif scope == 'b' then
    dict_expr = 'b:'
  elseif scope == 'v' then
    dict_expr = 'v:'
  else
    vim.api.nvim_err_writeln('Invalid scope: ' .. scope)
    return
  end

  -- Get all keys from the dictionary and filter by pattern using Vim's regex
  local keys = vim.fn.keys(vim.fn.eval(dict_expr))
  local matching_keys = vim.fn.sort(vim.fn.filter(keys, 'v:val =~ "' .. pattern .. '"'))

  -- Print each matching entry
  for _, key in ipairs(matching_keys) do
    local value = vim.fn.eval(dict_expr .. key)
    print(scope .. ':' .. key .. ' = ' .. vim.inspect(value))
  end
end

local function setup_commands()
  cmd('X', 'x')
  cmd('Q', 'q')
  cmd('Qa', 'qa')
  cmd('QA', 'qa')
  cmd('E', 'e <args>', { nargs = '*', complete = 'file' })
  cmd('W', 'w <args>', { nargs = '*', complete = 'file' })

  cmd('DumpVars', function(args)
    if 1 == #args.fargs then
      print_matching_dict_entries('g', args.fargs[1])
      print_matching_dict_entries('b', args.fargs[1])
      print_matching_dict_entries('v', args.fargs[1])
    elseif 2 == #args.fargs then
      print_matching_dict_entries(args.fargs[1], args.fargs[2])
    else
      error 'Usage: DumpVars [scope] pattern'
    end
  end, { nargs = '*' })
end

require('lib.au').command('setup.commands', 'User', function()
  setup_commands()
end, { pattern = 'VeryLazy' })
