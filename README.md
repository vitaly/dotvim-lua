<!-- lua/plugins/base-colors/README.md -->
## Color Schemes

Use `config.colorschemes` to define default colorscheme name.

"base16" and "tokyonight" themes are pre-installed.

You can add another theme module in `lua/plugins/base/colors.lua`.

`LoadVimrcBackground` command will source `~/.vimrc_background` file that is created by "base16" shell.

`<leader>vc` - to call `LoadVimrcBackground`.

<!-- lua/plugins/base-filer/README.md -->
## File Tree

[neotree](https://github.com/nvim-neo-tree/neo-tree.nvim)

### Config

- `my.config.neotree.position` - left (default), or right

## Maps

- `\\\\` - Quick File Popup
- `\\[` - Toggle File Tree
- `\\[` - Toggle File Tree / Reveal File

inside File TRee:

- `?` - show help
- `a` - add file / dir
- `r` - rename file / dir
- `m` - move file / dir
- `d` - delete file / dir
- `q` - close File Tree

<!-- lua/plugins/base-keymaps/README.md -->
## Basic Keymaps

- `<SPACE><tab><tab>` - Last Tab
- `<SPACE><tab>n` - New Tab

- `<SPACE>m` - show messages
- `<SPACE>M` - clear messages

- `<SPACE>x` - quite window
- `<SPACE>qq` - quite all
- `<SPACE>qQ` - quite all!
- `<SPACE>Q` - quite all!

- `<SPACE>n` - Next
- `<SPACE>p` - Prev

- `<SPACE>a` - Show Apps Menu
- `<SPACE>b` - Show Buffer Menu
- `<SPACE>f` - Show File Menu
- `<SPACE>w` - Show Window Menu
- `<SPACE>s` - Show Status Menu
- `<SPACE>t` - Show Tab Menu
- `<SPACE>v` - Show Vim Menu
- `<SPACE>Y` - Show Yank Menu

- `,<SPACE>` - Save
- `,e` - Show Eval Menu

- `\` - Show Toggle Menu

- `\\l` - Show Log Menu
- `\\lt` - Log TRACE
- `\\ld` - Log DEBUG
- `\\li` - Log INFO
- `\\lw` - Log WARN
- `\\le` - Log ERROR
- `\\lo` - Log OFF

### in diff-mode

- `,d` - Show Diff Menu

<!-- lua/plugins/cmp/README.md -->
## Completion

`<SPACE>Sg` - [GitHub Copilot](https://github.com/github/copilot.vim) Status
`M-[` - Copilot Prev
`M-]` - Copilot Next
`M-\\` - Copilot Suggest

<!-- lua/plugins/code-navigation/README.md -->
## Symbols Outline

> https://github.com/simrat39/symbols-outline.nvim

### Config

- `my.config.tagbar.position` - `left` / `right` (default)

### Maps

- `\t` - toggle Symbols Outline

## Aerial

> https://github.com/stevearc/aerial.nvim

> NOTE: we use Aerial through a Telescope popup

- `go` - show Fuzzy Outline

<!-- lua/plugins/development/README.md -->
## Xterm Color Table

- `<SPACE>SX` or `:XtermColorTable` to show the table

<!-- lua/plugins/editor-colors/README.md -->
### Colorizer

[nvim-colorizer.lua](https://github.com/norcalli/nvim-colorizer.lua) plugin parses color values
in the text and displays the colors either as a virtual text, background, or foreground color of the value.

- `\Cc` - toggle colorizer
- `\Cm` - toggle colorizer mode
- `\Cr` - reload colorizer

### Interesting Words

[vim-interestingwords](https://github.com/lfv89/vim-interestingwords) plugin colors words by request.

- `SPACE-k` - toggle color for the word under cursor
- `SPACE-K` - remove all word colors
- `n` - when cursor is over a colored word, goes to the next occurence, otherwise next search result
- `N` - when cursor is over a colored word, goes to the prev occurence, otherwise prev search result

<!-- lua/plugins/editor-comments/README.md -->
## Comments

[mini.comment](https://github.com/echasnovski/mini.comment)

- `gc` - Comments menu
- `\\;` - Toggle Comments

<!-- lua/plugins/editor-format/README.md -->
## AutoFormat

### maps

- `<localleader>af` - Format
- `<localleader>ae` - AutoFormat enable
- `<localleader>aE` - AutoFormat enable all
- `<localleader>ad` - AutoFormat disable
- `<localleader>at` - AutoFormat toggle
- `\\a` - AutoFormat toggle

### commands

`:Format`
`:FormatEnable [filetype]`
`:FormatDisable [filetype]`
`:FormatToggle [filetype]`

<!-- lua/plugins/editor-surround/README.md -->
## Surround

We are using https://github.com/echasnovski/mini.surround for surround.
Default mappings are changed slightly to be more like those of tpope's `vim-surround`: https://github.com/tpope/vim-surround

- `ys` - add
- `ds` - remove
- `cs` - change

<!-- lua/plugins/editor/README.md -->
## Bookmarks

[vim-bookmarks](https://github.com/MattesGroeger/vim-bookmarks)

- `mm` - Toggle Bookmark
- `mc` - Clear Bookmarks in Buffer
- `mx` - Clear Bookmark in All Buffers
- `mn` - Next Bookmark
- `mp` - Prev Bookmark
- `ma` - Show All Bookmarks
- `mi` - Add Bookmark Annotation
- `mkk` - Move Bookmark Up
- `mjj` - Move Bookmark Down

## Undo Tree

- `\u` To Toggle [undotree](http://github.com/mbbill/undotree)
- `g=` - to go to later version

## Switch

- `gs` - [switch.vim](https://github.com/AndrewRadev/switch.vim) to switch things. e.g. `true` <=> `false`, or `{ :a => a }` <=> `{ a: a }`

## Align

- `gA` - start [mini.align](https://github.com/echasnovski/mini.align) in Preview mode

<!- TODO: expand help here -->

## Global Search and Replace

- `:Gsearch` - to search and open results in a buffer for edit
- `:Greplace` - apply edits from the buffer into original files matched

## Zoom

- `\z` - toggle panel zoom

## Zen mode

- `\F` - Focus ([twilight.nvim](https://github.com/folke/twilight.nvim)). Dimm everything except area around the cursor line
- `\<tab>` - [Zen Mode](https://github.com/folke/zen-mode.nvim). Focus, but also zoom and center the window

## Multiple Cursors

[vim-visual-multi](https://github.com/mg979/vim-visual-multi)

- `ctrl-n` - to select words
- `n` - select next
- `q` - skip

- `ctrl-down` - add vertical cursor

- `tab` - toggle cursor and extend mode

## Illuminate

[vim-illuminate](https://github.com/RRethy/vim-illuminate) is used to automatically
highlight other uses of the word under the cursor using either LSP, Tree-sitter, or regex matching.

- `<m-i>` - textobject for the reference illuminated under the cursor
- `<m-n>` - go to next occurance
- `<m-p>` - go to prev occurance

## Yank Ring

[yanky.nvim](https://github.com/gbprod/yanky.nvim) is used for 'yank ring' functionality

after pasting:

- `[y` - previous paste
- `]y` - next paste

- `<SPACE-Y-CR` - yank history picker

<!-- lua/plugins/git/README.md -->
## GIT

- `SPACE-gs` - show git status
- `<SPACE-gp` - git push
- `<SPACE-gd` - git diff
- `<SPACE-gg` - git grep
- `<SPACE-gw` - git grep word under cursor
- `\\gs` - toggle gitsigns
- `\\gs` - toggle virtual git blame for current line

## Git Status Mode

- `g?` - help

changes:

- `-` - toggle stage / unstage of file or hunk
- 'X' - discard file changes or hunk
- `=` - toggle inline diff

commit:

- 'cc' - commit
- 'ca' - amend commit
- 'cf' rt- commit `--fixup` for file under cursor
- 'cF' - commit `--fixup` for file under cursor and immediately rebase it

rebase:

- `ri` - interactive rebase from ancestore of commit under the cursor
- `rr` - continue rebase
- `rs` - skip the current commit and continue rebase
- `ra` - abort rebase
- `rw` - interactive rebase with the commit under the cursor set to `reword`.
- `rm` - interactive rebase with the commit under the cursor set to `edit`.
- `rd` - interactive rebase with the commit under the cursor set to `drop`.

<!-- lua/plugins/lsp/README.md -->
## LSP

- `SPACE-Sl` - LSP Info
- `SPACEali` - LSP Info
- `SPACEall` - LSP Log
- `SPACEals` - LSP Start
- `SPACEalS` - LSP Stop
- `SPACEalr` - LSP Restart

### Null LS

https://github.com/jose-elias-alvarez/null-ls.nvim

NullLS is a generic LSP server that can use external tools to provide LSP
'formatting' and 'diagnostic' capabilities.

To show `null-ls` status: `<leader>Sn`

<!-- lua/plugins/session/README.md -->
## Sessions

- `SPACE-q` - to access Sessions menu

<!-- lua/plugins/statusline/README.md -->
## Status Line

- `\\S` - toggle Status Line

