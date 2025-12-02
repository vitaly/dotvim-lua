## Comments

- `gc` - Comments menu
- `gcc` - Toggle Comments
- `\;` - Toggle Comments

## Indent Scope

[mini-indentscope](https://github.com/nvim-mini/mini.indentscope)

Shows a thin line at the start of the current indent scope.

It is initially disabled, use the mapping to toggle it on/off

- `\i` - Toggle Indent Scope

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

- `gA` - start [mini.align](https://github.com/nvim-mini/mini.align) in Preview mode

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
