<!-- lua/plugins/base-colors/README.md -->
## Color Schemes

Use `config.colorschemes` to define default colorscheme name.

"base16" and "tokyonight" themes are pre-installed.

You can add another theme module in `lua/plugins/base/colors.lua`.

`LoadVimrcBackground` command will source `~/.vimrc_background` file that is created by "base16" shell.

`<leader>vc` - to call `LoadVimrcBackground`.

<!-- lua/plugins/base-keymaps/README.md -->

## Basic Keymaps

- `<SPACE>\`` - Last Tab
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

### in diff-mode

- `,d` - Show Diff Menu

<!-- lua/plugins/cmp/README.md -->
## Completion

<!-- lua/plugins/development/README.md -->
## Xterm Color Table

- `SPACE-SX` or ``:XtermColorTable` to show the table

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

## Zoom

- `\z` - toggle panel zoom

## Switch

- `gs` - [switch.vim](https://github.com/AndrewRadev/switch.vim) to switch things. e.g. `true` <=> `false`, or `{ :a => a }` <=> `{ a: a }`

## Align

- `gA` - start [mini.align](https://github.com/echasnovski/mini.align) in Preview mode

## Global Search and Replace

- `:Gsearch` - to search and open results in a buffer for edit
- `:Greplace` - apply edits from the buffer into original files matched

## ZEN MODE

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

