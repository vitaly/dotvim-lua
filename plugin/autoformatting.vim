" TODO: move to autoformat.lua

command! AutoFormatOn   let b:autoformat = 1| augroup  AuAutoFormat | exe "au! * <buffer>" | exe "au BufWritePost <buffer> Autoformat" | augroup END
command! AutoFormatOff  let b:autoformat = 0| au! AuAutoFormat * <buffer>

fun! s:disable_packer_refresh()
  let b:packer_refresh = 0
  " echo 'disable'
endf

fun! s:enable_packer_refresh()
  let b:packer_refresh = 1
  " echo 'enable'
endf

fun! AutoFormat()
  call s:disable_packer_refresh()
  call timer_start(500, s:enable_packer_refresh())
  if get(b:, 'format_with_lsp', 1)
    LspFormat
  else
    FormatWrite
  end
endf
command! Autoformat call AutoFormat()
nmap    <leader>ff    <cmd>Autoformat<cr>
