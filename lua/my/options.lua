




--------------------------------------------------------------------------------
-- nvim1 options
--------------------------------------------------------------------------------
-- local buffer = { o, bo }
-- local window = { o, wo }
-- opt('textwidth', 100, buffer)
-- opt('scrolloff', 7)
-- opt('wildignore', '*.o,*~,*.pyc')
-- opt('wildmode', 'longest,full')
-- opt('whichwrap', vim.o.whichwrap .. '<,>,h,l')
-- opt('inccommand', 'nosplit')
-- opt('lazyredraw', true)
-- opt('showmatch', true)
-- opt('tabstop', 2, buffer)
-- opt('softtabstop', 0, buffer)
-- opt('expandtab', true, buffer)
-- opt('shiftwidth', 2, buffer)
-- opt('number', true, window)
-- opt('relativenumber', true, window)
-- opt('smartindent', true, buffer)
-- opt('laststatus', 2)
-- opt('showmode', false)
-- opt('shada', [['20,<50,s10,h,/100]])
-- opt('hidden', true)
-- opt('shortmess', o.shortmess .. 'c')
-- opt('joinspaces', false)
-- opt('guicursor', [[n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50]])
-- opt('conceallevel', 2, window)
-- opt('concealcursor', 'nc', window)
-- opt('previewheight', 5)
-- opt('synmaxcol', 500, buffer)
-- opt('display', 'msgsep')
-- opt('modeline', false, buffer)
-- opt('mouse', 'nivh')
-- opt('signcolumn', 'yes:1', window)

-- -- Colorscheme
-- opt('termguicolors', true)
-- opt('background', 'dark')



--------------------------------------------------------------------------------
-- nvim2 options
--------------------------------------------------------------------------------
-- vim.g.did_load_filetypes = 1
-- vim.g.neovide_cursor_vfx_mode = "pixiedust" -- neovide trail
-- vim.opt.fillchars = { eob = " " } -- disable tilde fringe
-- vim.opt.splitbelow = true -- default to split below/right
-- vim.opt.splitright = true
-- vim.opt.mouse = "a" -- enable mouse
-- vim.opt.signcolumn = "yes" -- enable signcolumn
-- vim.opt.clipboard = "unnamedplus" -- enable universal clipboard
-- vim.opt.scrolloff = 3 -- leave 3 lines up/down while scrolling
vim.o.scrolloff = 4 -- leave 4 lines up/down while scrolling
-- vim.opt.tabstop = 4 -- tabs should be 4 "space" wide
-- vim.opt.shiftwidth = 4 -- tabs should be 4 "space" wide
-- vim.opt.lazyredraw = true -- usefull for regexes with large files
vim.o.lazyredraw = true
-- vim.opt.linebreak = true -- clean linebreaks
vim.o.linebreak = true -- clean linebreaks (during wrap)
-- vim.opt.number = false -- disable numbers
-- vim.opt.numberwidth = 2 -- two wide number column
-- vim.opt.shortmess:append "casI" -- disable intro
-- vim.opt.whichwrap:append "<>hl" -- clean aligned wraps
-- vim.opt.guifont = "Liga SFMono Nerd Font:h14" -- set guifont for neovide


--------------------------------------------------------------------------------
-- vim0 options
--------------------------------------------------------------------------------
vim.o.number = true
-- set numberwidth=3        -- number of culumns for line numbers
-- set textwidth=0          -- Do not wrap words (insert)
vim.o.wrap = false
-- set showcmd              -- Show (partial) command in status line.
vim.o.showmatch = true     -- Show matching brackets.
vim.o.visualbell = true     -- use visual bell instead of beeping
vim.o.listchars = 'tab:→⋅,trail:·,nbsp:+'
-- set list
vim.o.list = true

-- " highlight spell errors
-- hi SpellErrors guibg=red guifg=black ctermbg=red ctermfg=black

vim.o.wildignore = '*.o,*.a,*.so,*.swp,.git,.hg,.svn,CVS,RCS,*~,*.pyc'
-- set shell=/bin/bash              -- use bash for shell commands
vim.o.autowriteall = true                 -- Automatically save before commands like :next and :make
vim.o.hidden = true                       -- enable multiple modified buffers
-- set guioptions-=T                -- disable toolbar"
-- set completeopt=menuone,preview,noinsert
-- let bash_is_sh=1                 -- syntax shell files as bash scripts
vim.o.cinoptions = ':0,(s,u0,U1,g0,t0' -- some indentation options ':h cinoptions' for details
-- set modelines=5                  -- number of lines to check for vim: directives at the start/end of file
-- "set fixdel                      -- fix terminal code for delete (if delete is broken but backspace works)

vim.o.ts = 4
vim.o.sw = 3
vim.o.et = true

-- set ttimeoutlen=50       -- fast Esc to normal mode
vim.o.updatetime = 1000

-- let g:mapleader = " "
-- let g:maplocalleader = ","
-- set timeoutlen=5000      -- give 5s to complete mapping sequence

-- mouse settings
if 1 == vim.fn.has('mouse') then
  vim.o.mouse = 'a'
end

-- set hlsearch             -- Highlight search match
vim.o.ignorecase = true
vim.o.smartcase = true

--  -- directory settings
-- call system('mkdir -p ~/.backup/undo/ > /dev/null 2>&1')
-- set backupdir=~/.backup,.              -- list of directories for the backup file
-- set directory=~/.backup,~/tmp,.        -- list of directory names for the swap file
-- set nobackup                           -- do not write backup files
-- set backupskip+=~/tmp/*,/private/tmp/* -- skip backups on OSX temp dir, for crontab -e to properly work
vim.o.swapfile = false -- disable swap
-- set undodir=~/.backup/undo/,~/tmp,.
vim.o.undofile = true -- enable persistent undo

-- set foldcolumn=0         -- columns for folding
vim.o.foldmethod = 'syntax'
-- set foldlevel=9
-- set nofoldenable         -- dont fold by default "
-- set eol
-- set nobinary
-- " set t_Co=256
-- " set t_AB=^[[48;5;%dm
-- " set t_AF=^[[38;5;%dm
-- " set notermguicolors
if vim.fn.has('termguicolors') == 1 then
  vim.o.termguicolors = true
end

vim.o.cursorline = true
vim.o.cursorcolumn = true

-- set foldcolumn=2
-- set concealcursor=n
-- set conceallevel=2

-- " set relativenumber!
-- set modeline
-- " highlight column after textwidth
-- set cc=+1
-- nmap ,Q :qa<cr>

-- set virtualedit=all
-- set diffopt-=internal
-- " driving me insane this thing
-- command Q q
-- command Qa qa
-- command QA qa
-- command -nargs=* -complete=file W w <args>
-- command -nargs=* -complete=file E e <args>

-- autoload local project .vimrc files
vim.o.exrc = true
vim.o.secure = true
