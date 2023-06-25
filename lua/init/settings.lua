-- lua/init/options.lua

local g = vim.g
local fn = vim.fn
local set = vim.opt
local opt = vim.opt
local env = vim.env

local has = function(x)
  return fn.has(x) == 1
end

--------------------------------------------------------------------------------
--- ENV VARS
--------------------------------------------------------------------------------
vim.env.CC = 'gcc-12'

--------------------------------------------------------------------------------
--- GLOBALS
--------------------------------------------------------------------------------

_G.my = _G.my or {}
my.root = vim.uv.fs_realpath(vim.fn.stdpath 'config')
g.MY_ROOT = my.root

g.mapleader = [[ ]]
g.maplocalleader = [[,]]

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
set.laststatus = 3
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
-- set.background = 'light'
-- set.background = 'dark'

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
set.clipboard = 'unnamedplus' -- enable universal clipboard

-- vim.opt.scrolloff = 3 -- leave 3 lines up/down while scrolling
set.scrolloff = 4 -- leave 4 lines up/down while scrolling
-- vim.opt.tabstop = 4 -- tabs should be 4 "space" wide
-- vim.opt.shiftwidth = 4 -- tabs should be 4 "space" wide
-- vim.opt.lazyredraw = true -- usefull for regexes with large files
set.lazyredraw = true
-- vim.opt.linebreak = true -- clean linebreaks
set.linebreak = true -- clean linebreaks (during wrap)
-- vim.opt.number = false -- disable numbers
-- vim.opt.numberwidth = 2 -- two wide number column
-- vim.opt.shortmess:append "casI" -- disable intro
-- vim.opt.whichwrap:append "<>hl" -- clean aligned wraps
-- vim.opt.guifont = "Liga SFMono Nerd Font:h14" -- set guifont for neovide

set.shortmess = opt.shortmess
  + 's' -- don't give "search hit BOTTOM, continuing at TOP" etc.
  + 'F' -- no info messages when loading file
--  + 'I' -- no intro message

--------------------------------------------------------------------------------
-- vim0 options
--------------------------------------------------------------------------------
set.number = true
-- set numberwidth=3        -- number of culumns for line numbers
-- set textwidth=0          -- Do not wrap words (insert)
set.wrap = false
-- set showcmd              -- Show (partial) command in status line.
set.showmatch = true -- Show matching brackets.
set.visualbell = true -- use visual bell instead of beeping
set.listchars = 'tab:→⋅,trail:·,nbsp:+'
-- set list
set.list = true

-- " highlight spell errors
-- hi SpellErrors guibg=red guifg=black ctermbg=red ctermfg=black

set.wildignore = '*.o,*.a,*.so,*.swp,.git,.hg,.svn,CVS,RCS,*~,*.pyc'
-- set shell=/bin/bash              -- use bash for shell commands
set.autowriteall = true -- Automatically save before commands like :next and :make
set.hidden = true -- enable multiple modified buffers
-- set guioptions-=T                -- disable toolbar"
-- set completeopt=menuone,preview,noinsert
-- set.completeopt = 'menuone,preview,noinsert,noselect'

-- let bash_is_sh=1                 -- syntax shell files as bash scripts
set.cinoptions = ':0,(s,u0,U1,g0,t0' -- some indentation options ':h cinoptions' for details
-- set modelines=5                  -- number of lines to check for vim: directives at the start/end of file
-- "set fixdel                      -- fix terminal code for delete (if delete is broken but backspace works)

set.ts = 2
set.sw = 2
set.et = true

-- set ttimeoutlen=50       -- fast Esc to normal mode
set.updatetime = 300 -- CursorHold delay

-- mouse settings
if has 'mouse' then
  set.mouse = 'a'
end

-- set hlsearch             -- Highlight search match
set.ignorecase = true
set.smartcase = true

--  -- directory settings
-- call system('mkdir -p ~/.backup/undo/ > /dev/null 2>&1')
-- set backupdir=~/.backup,.              -- list of directories for the backup file
-- set directory=~/.backup,~/tmp,.        -- list of directory names for the swap file
-- set nobackup                           -- do not write backup files
-- set backupskip+=~/tmp/*,/private/tmp/* -- skip backups on OSX temp dir, for crontab -e to properly work
set.swapfile = false -- disable swap
-- set undodir=~/.backup/undo/,~/tmp,.
set.undofile = true -- enable persistent undo

-- set foldcolumn=0         -- columns for folding
-- set.foldmethod = 'syntax'
-- set foldlevel=9
set.foldlevel = 9
-- set nofoldenable         -- dont fold by default "
-- set.foldenable = false -- dont fold by default "
set.foldcolumn = 'auto'
set.signcolumn = 'auto:4'
-- set eol
-- set nobinary
-- " set t_Co=256
-- " set t_AB=^[[48;5;%dm
-- " set t_AF=^[[38;5;%dm
-- " set notermguicolors
-- TODO: make a toggle
if has 'termguicolors' then
  set.termguicolors = true
end

set.cursorline = true
set.cursorcolumn = true

-- set concealcursor=n
set.concealcursor = ''
set.conceallevel = 1 -- - replace by one space. prevents text from jumping in most of the cases

-- " set relativenumber!
set.relativenumber = false
-- set modeline
-- " highlight column after textwidth
-- set cc=+1

-- set virtualedit=all
set.virtualedit = 'all'
-- set diffopt-=internal
-- " driving me insane this thing

-- autoload local project .vimrc files
set.exrc = true
set.secure = true

set.showmode = false
