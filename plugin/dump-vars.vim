
fu! DumpVarsEx(prefix, dict, match) abort
  for l:v in sort(filter(keys(a:dict), 'v:val =~ "' . a:match . '"'))
    echon a:prefix . l:v . ' = '
    echon get(a:dict, l:v)
    echo ''
  endfor
endfu
fu! GDumpVars(match) abort
  call DumpVarsEx('g:', g:, a:match)
endfu
fu! BDumpVars(match) abort
  call DumpVarsEx('b:', b:, a:match)
endfu
fu! DumpVars(match) abort
  call GDumpVars(a:match)
  call BDumpVars(a:match)
endfu
command! -nargs=1 GDumpVars call GDumpVars('<args>')
command! -nargs=1 BDumpVars call BDumpVars('<args>')
command! -nargs=1 DumpVars  call DumpVars('<args>')
