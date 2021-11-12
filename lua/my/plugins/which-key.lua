vim.cmd [[
let g:WhichKeyFormatFunc = function('my#keymap#format')

augroup RegisterKeyMap
  autocmd!
  autocmd   User    vim-which-key     call which_key#register(g:mapleader, 'g:my#keymap#leader#map')
  autocmd   User    vim-which-key     call which_key#register(g:maplocalleader, 'g:my#keymap#localleader#map')
augroup END

nnoremap <silent> <leader>      :WhichKey       ' '<CR>
nnoremap <silent> <localleader> :WhichKey       ','<CR>

xnoremap <silent> <leader>      :<c-u>WhichKeyVisual ' '<CR>
xnoremap <silent> <localleader> :<c-u>WhichKeyVisual ','<CR>

map                             <plug>(Search/Keys)       :<c-u>WhichKey       ''
nmap <leader>sk                 <plug>(Search/Keys)

let g:which_key_sep = "|"
]]
