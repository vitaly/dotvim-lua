
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
fu! VDumpVars(match) abort
  call DumpVarsEx('v:', v:, a:match)
endfu
fu! DumpVars(match) abort
  call GDumpVars(a:match)
  call BDumpVars(a:match)
  call VDumpVars(a:match)
endfu
command! -nargs=? GDumpVars call GDumpVars('<args>')
command! -nargs=? BDumpVars call BDumpVars('<args>')
command! -nargs=? VDumpVars call VDumpVars('<args>')
command! -nargs=? DumpVars  call DumpVars('<args>')
