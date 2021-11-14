nnoremap <leader><space>        :

call my#keymap#leader('a', '+App')

call my#keymap#leader('ap', '+Packer')

nnoremap                                  <plug>packer(Sync)                            <cmd>PackerSync<cr>
nmap              <leader>ap<cr>          <plug>packer(Sync)

nnoremap                                  <plug>packer(Compile)                         <cmd>PackerCompile<cr>
nmap              <leader>apc             <plug>packer(Compile)
nmap              <leader>ap<space>       <plug>packer(Compile)
nmap              <leader>R               <plug>packer(Compile)

nnoremap                                  <plug>packer(Install)                         <cmd>PackerInstall<cr>
nmap              <leader>api             <plug>packer(Install)

nnoremap                                  <plug>packer(Status)                          <cmd>PackerStatus<cr>
nmap              <leader>aps             <plug>packer(Status)

nnoremap                                  <plug>packer(Update)                          <cmd>PackerUpdate<cr>
nmap              <leader>apu             <plug>packer(Update)

nnoremap                                  <plug>packer(Clean)                           <cmd>PackerClean<cr>
nmap              <leader>apC             <plug>packer(Clean)



call my#keymap#leader('v', '+Vim')

noremap                                   <plug>(Vim/Redraw)                            <cmd>redraw!<cr>
nmap              <leader>vr              <plug>(Vim/Redraw)


call my#keymap#leader('t', '+Tab')

noremap                                   <plug>(Tab/New)                               <cmd>tabnew<cr>
nmap              <leader>tn              <plug>(Tab/New)

map                                       <plug>(Tab/New-File)                          <plug>(Tab/New)<plug>(File/Fuzzy-Find)
nmap              <leader>tf              <plug>(Tab/New-File)


call my#keymap#leader('b', '+Buffer')

noremap                                   <plug>(Buffer/Next)                           <cmd>bn<cr>
nmap              <leader>bn              <plug>(Buffer/Next)

noremap                                   <plug>(Buffer/Prev)                           <cmd>bp<cr>
nmap              <leader>bp              <plug>(Buffer/Prev)

noremap                                   <plug>(Buffer/Delete)                         <cmd>bd<cr>
nmap              <leader>bd              <plug>(Buffer/Delete)


call my#keymap#leader('f', '+File')

noremap                                   <plug>(File/Save)                             <cmd>w<cr>
nmap              <leader>fs              <plug>(File/Save)
nmap              <localleader><leader>   <plug>(File/Save)
nmap              <leader>ww              <plug>(File/Save)

noremap                                   <plug>(File/Save-All)                         <cmd>wa<cr>
nmap              <leader>fa              <plug>(File/Save-All)

noremap                                   <plug>(File/Make-Executable)                  <cmd>!chmod +x %<cr>
nmap              <leader>fx              <plug>(File/Make-Executable)


call my#keymap#leader('ft', '+Toggle')
call my#keymap#leader('fe', '+Edit')

noremap                                   <plug>(File/Edit/scratch.vim)                 <cmd>e ~/.vim/scratch.vim<cr>
nmap              <leader>fes             <plug>(File/Edit/scratch.vim)

call my#keymap#leader('fev', '+Vim')

noremap                                   <plug>(File/Edit/Vim/Directory)               <cmd>e ~/.vim/<cr>
nmap              <leader>fevd            <plug>(File/Edit/Vim/Directory)

noremap                                   <plug>(File/Edit/Vim/After)                   <cmd>e ~/.vim/vimrc.after<cr>
nmap              <leader>feva            <plug>(File/Edit/Vim/After)

noremap                                   <plug>(File/Edit/Vim/Plugins)                 <cmd>e ~/.vim/vimrc.plugins<cr>
nmap              <leader>fevp            <plug>(File/Edit/Vim/Plugins)

noremap                                   <plug>(File/Edit/Vim/Bindings)                <cmd>e ~/.vim/vimrc.bindings<cr>
nmap              <leader>fevb            <plug>(File/Edit/Vim/Bindings)

call my#keymap#leader('fel', '+Local')

noremap                                   <plug>(File/Edit/Local/Directory)             <cmd>e ~/.vim/local<cr>
nmap              <leader>feld            <plug>(File/Edit/Local/Directory)

noremap                                   <plug>(File/Edit/Local/After)                 <cmd>e ~/.vim/local/vimrc.after<cr>
nmap              <leader>fela            <plug>(File/Edit/Local/After)

noremap                                   <plug>(File/Edit/Local/Plugins)               <cmd>e ~/.vim/local/vimrc.plugins<cr>
nmap              <leader>felp            <plug>(File/Edit/Local/Plugins)

noremap                                   <plug>(File/Edit/Local/Bindings)              <cmd>e ~/.vim/local/vimrc.bindings<cr>
nmap              <leader>felb            <plug>(File/Edit/Local/Bindings)

call my#keymap#leader('q', '+Quit')

noremap                                   <plug>(Quit-All)                              <cmd>qa<cr>
nmap              <leader>q               <plug>(Quit-All)

noremap                                   <plug>Window(Quit)                           <cmd>q<cr>
nmap              <leader>x               <plug>Window(Quit)

call my#keymap#leader('w', '+Window' )

nmap              <leader>wq              <plug>Window(Quit)

noremap                                   <plug>(Window/Max-Width)                      <C-w><bar>
nmap              <leader>w<bar>          <plug>(Window/Max-Width)

noremap                                   <plug>(Window/Max-Height)                     <C-w>_
nmap              <leader>w_              <plug>(Window/Max-Height)

noremap                                   <plug>(Window/Rebalance)                      <C-w>=
nmap              <leader>w=              <plug>(Window/Rebalance)

noremap                                   <plug>(Window/Swap)                           <C-w>x
nmap              <leader>wx              <plug>(Window/Swap)

nmap                                      <plug>(Window/Move-Up)                        <c-w>K
nmap              <leader>wK              <plug>(Window/Move-Up)

nmap                                      <plug>(Window/Move-Down)                      <c-w>J
nmap              <leader>wJ              <plug>(Window/Move-Down)

nmap                                      <plug>(Window/Move-Left)                      <c-w>H
nmap              <leader>wH              <plug>(Window/Move-Left)

nmap                                      <plug>(Window/Move-Right)                     <c-w>L
nmap              <leader>wL              <plug>(Window/Move-Right)

nmap                                      <plug>(Window/Move-To-New-Tab)                <c-w>T
nmap              <leader>wt              <plug>(Window/Move-To-New-Tab)

noremap                                   <plug>(Window/Split)                          <cmd>split<cr><c-w>j
nmap              <leader>ws              <plug>(Window/Split)
nmap              <leader>w-              <plug>(Window/Split)

noremap                                   <plug>(Window/VSplit)                         <cmd>vsplit<cr><c-w>l
nmap              <leader>wv              <plug>(Window/VSplit)
nmap              <leader>w<Bslash>       <plug>(Window/VSplit)

noremap                                   <plug>(Window/Only)                           <C-w>o
nmap              <leader>wo              <plug>(Window/Only)

" Don't use Ex mode, use Q for formatting
map Q gq



noremap                                   <plug>(Last-Buffer) <cmd>b#<cr>
nmap              <leader><Tab>           <plug>(Last-Buffer)

" keep selection after in/outdent
xnoremap          < <gv
xnoremap          > >gv

" better navigation of wrapped lines
nnoremap          j gj
nnoremap          k gk

" easier increment/decrement
nnoremap          + <C-a>
nnoremap          - <C-x>

" center display after searching
nnoremap          n   nzz
nnoremap          N   Nzz
nnoremap          *   *zz
nnoremap          #   #zz
nnoremap          g*  g*zz
nnoremap          g#  g#z

" disable paste mode when leaving Insert Mode
au InsertLeave * set nopaste

" fast expand current file's directory in command mode
cnoremap          %% <C-R>=expand('%:h').'/'<cr>
cnoremap          %^ <C-R>=expand('%:p:h').'/'<cr>


call my#keymap#leader('Y', '+Yank')

noremap                                   <plug>(Yank/File-Path)                        :let @*=expand("%")<cr>:echo "Copied file path to clipboard"<cr>
nmap              <leader>Yp              <plug>(Yank/File-Path)

noremap                                   <plug>(Yank/File-Name)                        :let @*=expand("%:t")<cr>:echo "Copied file name to clipboard"<cr>
nmap              <leader>Yf              <plug>(Yank/File-Name)

noremap                                   <plug>(Yank/File-Directory)                   :let @*=expand("%:h")<cr>:echo "Copied file directory to clipboard"<cr>
nmap              <leader>Yd              <plug>(Yank/File-Directory)

noremap           <silent>                <plug>(Yank/Current-Directory)                :let @*=getcwd()<cr>:echo @*<cr>
nmap              <leader>Y.              <plug>(Yank/Current-Directory)




inoremap          <C-K>                                                                 <Up>
inoremap          <C-J>                                                                 <Down>

inoremap          <C-H>                                                                 <Left>
inoremap          <C-L>                                                                 <Right>

cnoremap          <C-K>                                                                 <Up>
cnoremap          <C-J>                                                                 <Down>

function! s:load_vimrc_background()
  if filereadable(expand("~/.vimrc_background"))
    let base16colorspace=256
    try | source ~/.vimrc_background | catch | echo "colorscheme load error" | endtry
  endif
endfunction

nnoremap                                  <plug>(Vim/Update-Colors)                     :call <SID>load_vimrc_background()<CR>
nmap     <silent> <leader>vc              <plug>(Vim/Update-Colors)

if !exists('g:skip_vimrc_background')
  call s:load_vimrc_background()
endif


nnoremap          <C-j>                                                                 :m .+1<CR>==
nnoremap          <C-k>                                                                 :m .-2<CR>==
xnoremap          <C-j>                                                                 :m '>+1<CR>gv=gv
xnoremap          <C-k>                                                                 :m '<-2<CR>gv=gv


noremap                                   <plug>Messages()                              <cmd>messages<cr>
noremap                                   <plug>Clear(Messages)                         <cmd>messages clear<cr>

nmap              <leader>m               <plug>Messages()
nmap              <leader>M               <plug>Clear(Messages)

noremap                                   <plug>(Next)                                  <c,d>cn<cr>
nmap              <leader>n               <plug>(Next)

noremap                                   <plug>(Prev)                                  <cmd>cp<cr>
nmap              <leader>p               <plug>(Prev)
