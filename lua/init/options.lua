--------------------------------------------------------------------------------
--- ENV VARS
--------------------------------------------------------------------------------
vim.env.CC = 'gcc-12'

--------------------------------------------------------------------------------
--- GLOBALS
--------------------------------------------------------------------------------

vim.g.mapleader = [[ ]]
vim.g.maplocalleader = [[,]]

--------------------------------------------------------------------------------
-- OPTIONS
--------------------------------------------------------------------------------

local opt = vim.opt
local has = function(x)
  return vim.fn.has(x) == 1
end

opt.autowriteall = true -- Automatically save before commands like :next and :make
opt.clipboard = "unnamedplus" -- Sync with system clipboard
opt.completeopt = "menu,menuone,noselect"
opt.conceallevel = 3 -- Hide * markup for bold and italic
opt.confirm = true -- Confirm to save changes before exiting modified buffer
opt.cursorline = true
opt.expandtab = true
opt.foldcolumn='auto'
opt.foldlevel = 2
opt.formatoptions = opt.formatoptions
+ "t" -- Auto-wrap text using 'textwidth'
+ "c" -- Auto-wrap comments using 'textwidth', inserting the current comment leader automatically.
+ "q" -- Allow formatting of comments with "gq".
+ "j" -- Where it makes sense, remove a comment leader when joining lines.

+ "r" -- Automatically insert the current comment leader after hitting <Enter> in Insert mode.
+ "o" -- Automatically insert the current comment leader after hitting 'o' or 'O' in Normal mode.
+ "l" -- Long lines are not broken in insert mode
+ "n" -- When formatting text, recognize numbered lists

opt.grepformat = "%f:%l:%c:%m" -- rg includes column number
opt.grepprg = "rg --vimgrep"

opt.exrc = true
opt.ignorecase = true
opt.laststatus = 3
opt.lazyredraw = true
opt.linebreak = true -- clean linebreaks (during wrap)
opt.list = true -- Show invisible characters
opt.listchars = 'tab:→⋅,trail:·,nbsp:+'
if has 'mouse' then
  opt.mouse = 'a'
end
opt.number = true -- Show line numbers
opt.pumblend = 10 -- Popup blend
opt.pumheight = 10 -- Max items in a popup menu
opt.relativenumber = false
opt.scrolloff = 4 -- Scroll context lines
opt.secure = true -- Everything is allowed in 'exrc' files since they must be explicitly marked trusted.
opt.sessionoptions = { "buffers", "curdir", "tabpages", "winsize" }
opt.shiftround = true -- Round shift indent to shiftwidth multiples
opt.shiftwidth = 2
opt.shortmess = opt.shortmess
  + 's' -- don't give "search hit BOTTOM, continuing at TOP" etc.
  + 'F' -- no info messages when loading file
  + 'I' -- no intro message
  + 'W' -- don't give "written" or "[w]" when writing a file
  + 'c' -- don't give |ins-completion-menu| messages
  + 'C' -- don't give messages while scanning for ins-completion
opt.showmode = false -- Dont show mode since we have a statusline
opt.sidescrolloff = 8 -- Scroll lines of context
opt.signcolumn = "yes"
opt.smartcase = true
opt.shiftwidth = 2
opt.smartindent = true -- Insert indents automatically
opt.spelllang = { "en" }
opt.swapfile = false -- disable swap
opt.splitbelow = true
opt.splitright = true
opt.tabstop = 2
opt.termguicolors = true -- True color support
opt.timeoutlen = 300
opt.undofile = true -- persistent undo file
opt.undolevels = 10000
opt.updatetime = 300 -- CursorHold delay
opt.virtualedit = 'all'
opt.visualbell = true -- use visual bell instead of beeping
opt.wildignore = '*.o,*.a,*.so,*.swp,.git,.hg,.svn,CVS,RCS,*~,*.pyc','*.zwc'
opt.wildmode = "longest:full,full" -- Command-line completion mode
opt.wrap = false
