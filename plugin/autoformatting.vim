
command! AutoFormatOn   let b:autoformat = 1| augroup  AuAutoFormat | exe "au! * <buffer>" | exe "au BufWritePre <buffer> undojoin | Autoformat" | augroup END
command! AutoFormatOff  let b:autoformat = 0| au! AuAutoFormat * <buffer>

fun! ToggleAutoFormat()
  if get(b:, 'autoformat', 0)
    echo "autoformat off"
    AutoFormatOff
  else
    echo "autoformat on"
    AutoFormatOn
  endif
endf

map                                    <plug>(Toggle/AutoFormat)       :call ToggleAutoFormat()<CR>
nmap    <silent> <leader>Ta            <plug>(Toggle/AutoFormat)
