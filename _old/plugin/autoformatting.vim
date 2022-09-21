" TODO: move to autoformat.lua

command! AutoFormatOn   let b:autoformat = 1| augroup  AuAutoFormat | exe "au! * <buffer>" | exe "au BufWritePost <buffer> Autoformat" | augroup END
command! AutoFormatOff  let b:autoformat = 0| au! AuAutoFormat * <buffer>

" FIXME: this is wrong direction for dependency. autoformat should not know about packer specifics. packer should account for autoformatting
fun! s:disable_packer_refresh()
  if get(g:, 'format_debug', 0) | echo "disable packer refresh" | end

  let b:packer_refresh = 0
  " echo 'disable'
endf

fun! s:enable_packer_refresh()
  if get(g:, 'format_debug', 0) | echo "enable packer refresh" | end
  let b:packer_refresh = 1
  " echo 'enable'
endf


fun! AutoFormat()
  call s:disable_packer_refresh()
  call timer_start(500, s:enable_packer_refresh())
  if get(b:, 'format_with_lsp', 1)
    if get(g:, 'format_debug', 0) | echo "LspFormat" | end
    LspFormat
  else
    if get(g:, 'format_debug', 0) | echo "FormatWrite" | end
    FormatWrite
  end
endf
command! Autoformat call AutoFormat()
