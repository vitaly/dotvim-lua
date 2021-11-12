nnoremap <leader><space>        :

call my#keymap#leader('a', '+App')

call my#keymap#leader('ap', '+Packer')

nnoremap                                  <plug>packer(Sync)                            <cmd>PackerSync<cr>
nmap              <leader>ap<cr>          <plug>packer(Sync)

nnoremap                                  <plug>packer(Compile)                         <cmd>PackerCompile<cr>
nmap              <leader>apc             <plug>packer(Compile)

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
nmap              <leader>Q               <plug>(Quit-All)

noremap                                   <plug>(Quit-Window)                           <cmd>q<cr>
nmap              <leader>q               <plug>(Quit-Window)

call my#keymap#leader('w', '+Window' )

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
