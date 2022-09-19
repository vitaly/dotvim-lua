echom 'plugin/background'
" source ~/.vimrc_background
" function! s:load_vimrc_background()
"   if filereadable(expand("~/.vimrc_background"))
"     let base16colorspace=256
"     try | source ~/.vimrc_background | catch | echo "colorscheme load error" | endtry
"   endif
" endfunction

" nnoremap                                  <plug>(Vim/Update-Colors)                     :call <SID>load_vimrc_background()<CR>
" nmap     <silent> <leader>vc              <plug>(Vim/Update-Colors)

" if !exists('g:skip_vimrc_background')
"   call s:load_vimrc_background()
" else
"   echom 'skip background'
" endif

