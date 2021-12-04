nnoremap <leader><space>        :

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





noremap                                   <plug>(Vim/Redraw)                            <cmd>redraw!<cr>
nmap              <leader>vr              <plug>(Vim/Redraw)




noremap                                   <plug>(Tab/New)                               <cmd>tabnew<cr>
nmap              <leader>tn              <plug>(Tab/New)

map                                       <plug>(Tab/New-File)                          <plug>(Tab/New)<plug>(File/Fuzzy-Find)
nmap              <leader>tf              <plug>(Tab/New-File)




noremap                                   <plug>(Buffer/Next)                           <cmd>bn<cr>
nmap              <leader>bn              <plug>(Buffer/Next)

noremap                                   <plug>(Buffer/Prev)                           <cmd>bp<cr>
nmap              <leader>bp              <plug>(Buffer/Prev)

noremap                                   <plug>(Buffer/Delete)                         <cmd>bd<cr>
nmap              <leader>bd              <plug>(Buffer/Delete)




noremap                                   <plug>(File/Save)                             <cmd>w<cr>
nmap              <leader>fs              <plug>(File/Save)
nmap              <localleader><leader>   <plug>(File/Save)
nmap              <leader>ww              <plug>(File/Save)

noremap                                   <plug>(File/Save-All)                         <cmd>wa<cr>
nmap              <leader>fa              <plug>(File/Save-All)

noremap                                   <plug>(File/Make-Executable)                  <cmd>!chmod +x %<cr>
nmap              <leader>fx              <plug>(File/Make-Executable)





noremap                                   <plug>(File/Edit/scratch)                     <cmd>exe 'e' g:MYVIMDIR.'/scratch.lua'<cr>
nmap              <leader>fes             <plug>(File/Edit/scratch)



noremap                                   <plug>(File/Edit/Init)                        <cmd>exe 'e' g:MYVIMDIR.'/init.lua'<cr>
nmap              <leader>fei             <plug>(File/Edit/Init)

noremap                                   <plug>(File/Edit/Plugins)                     <cmd>exe 'e' g:MYVIMDIR.'/lua/my/plugins.lua'<cr>
nmap              <leader>fep             <plug>(File/Edit/Plugins)

noremap                                   <plug>(File/Edit/Options)                     <cmd>exe 'e' g:MYVIMDIR.'/lua/my/options.lua'<cr>
nmap              <leader>feo             <plug>(File/Edit/Options)

noremap                                   <plug>(File/Edit/Mappings)                    <cmd>exe 'e' g:MYVIMDIR.'/plugin/mappings.vim'<cr>
nmap              <leader>fem             <plug>(File/Edit/Mappings)

noremap                                   <plug>(File/Edit/Notes)                       <cmd>exe 'e' g:MYVIMDIR.'/NOTES.md'<cr>
nmap              <leader>fen             <plug>(File/Edit/Notes)

noremap                                   <plug>(File/Edit/Lsp-Log)                     <cmd>exe 'e' stdpath('cache').'/lsp.log'<cr>
nmap              <leader>fel             <plug>(File/Edit/Lsp-Log)


noremap                                   <plug>(Quit-All)                              <cmd>qa<cr>
nmap              <leader>q               <plug>(Quit-All)

noremap                                   <plug>(Quit-All!)                             <cmd>qa!<cr>
nmap              <leader>Q               <plug>(Quit-All!)


noremap                                   <plug>Window(Quit)                           <cmd>q<cr>
nmap              <leader>wq              <plug>Window(Quit)
nmap              <leader>x               <plug>Window(Quit)

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

noremap                                   <plug>(Next)                                  <cmd>cn<cr>
nmap              <leader>n               <plug>(Next)

noremap                                   <plug>(Prev)                                  <cmd>cp<cr>
nmap              <leader>p               <plug>(Prev)


nmap              <silent><esc>           <cmd>silent noh<cr>
