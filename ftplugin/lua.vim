AutoFormatOn
let b:format_with_lsp = 0

noremap <buffer> <silent>        <plug>(Eval/Line)    yy:lua "<CR>
nmap    <buffer> <localleader>ee <plug>(Eval/Line)

noremap <buffer>                 <plug>(Eval/File)    <cmd>so %<cr>
nmap    <buffer> <localleader>ef <plug>(Eval/File)
