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
