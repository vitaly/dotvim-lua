local function cmd(name, command, opts)
  vim.api.nvim_create_user_command(name, command, opts or {})
end

vim.cmd [[
  fu! PrintMatchingDictEntries(scope, match) abort
    if a:scope == 'g'
      let l:dict = g:
    elseif a:scope == 'b'
      let l:dict = b:
    elseif a:scope == 'v'
      let l:dict = v:
    else
      echoerr 'Invalid scope: ' . a:scope
      return
    endif

    for l:v in sort(filter(keys(l:dict), 'v:val =~ "' . a:match . '"'))
      echon a:scope . ':' . l:v . ' = '
      echon get(l:dict, l:v)
      echo ''
    endfor
  endfu
]]

local function setup_commands()
  cmd('X', 'x')
  cmd('Q', 'q')
  cmd('Qa', 'qa')
  cmd('QA', 'qa')
  cmd('E', 'e', { nargs = '*', complete = 'file' })
  cmd('W', 'w', { nargs = '*', complete = 'file' })

  cmd('DumpVars', function(args)
    if 1 == #args.fargs then
      vim.fn.PrintMatchingDictEntries('g', args.fargs[1])
      vim.fn.PrintMatchingDictEntries('b', args.fargs[1])
      vim.fn.PrintMatchingDictEntries('v', args.fargs[1])
    elseif 2 == #args.fargs then
      vim.fn.PrintMatchingDictEntries(args.fargs[1], args.fargs[2])
    else
      error 'Usage: DumpVars [scope] pattern'
    end
  end, { nargs = '*' })
end

require('lib.au').command('setup.commands', 'User', function()
  setup_commands()
end, { pattern = 'VeryLazy' })
