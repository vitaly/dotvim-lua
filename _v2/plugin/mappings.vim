nnoremap          <leader><space>        :


" Don't use Ex mode, use Q for formatting
map Q gq


noremap                                   <plug>(Last-Buffer) <cmd>b#<cr>
nmap              <leader>`               <plug>(Last-Buffer)

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


cmap              <C-K>                                                                 <Up>
cmap              <C-J>                                                                 <Down>
imap              <C-K>                                                                 <Up>
imap              <C-J>                                                                 <Down>
imap              <C-H>                                                                 <Left>
imap              <C-L>                                                                 <Right>



nnoremap          <C-j>                                                                 :m .+1<CR>==
nnoremap          <C-k>                                                                 :m .-2<CR>==
xnoremap          <C-j>                                                                 :m '>+1<CR>gv=gv
xnoremap          <C-k>                                                                 :m '<-2<CR>gv=gv



nmap              <silent><esc>           <cmd>silent noh<cr>

" nmap              <M-LeftMouse>           <LeftMouse>*
