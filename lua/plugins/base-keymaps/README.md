## Basic Keymaps

[which-key.nvim](https://github.com/folke/which-key.nvim)

### Navigation

- `<tab><tab>` - Switch to last buffer
- `<tab><space>` - New Tab
- `j` / `k` - Move down/up (visual line)
- `n` / `N` - Search next/prev and center
- `*` / `#` - Search word under cursor forward/back
- `g*` / `g#` - Search word (no word boundary)

### Text Editing

- `+` - Increment number
- `-` - Decrement number
- `<C-j>` / `<C-k>` - Move line down/up
- `<` / `>` - Indent (in visual mode, keep selection)
- `Q` - Format word (gq)

### Save & Quit

- `<space><space>` - Save
- `<leader>q` - Quit All
- `<leader>x` - Close Window
- `<leader>QQ` - Quit All!

### Buffer

- `<leader>bn` - Next Buffer
- `<leader>bp` - Prev Buffer
- `<leader>bd` - Delete Buffer

### File

- `<leader>fs` - Save File
- `<leader>fa` - Save All Files
- `<leader>fx` - Make Executable
- `<leader>fec` - Edit Config
- `<leader>fei` - Edit init.lua

### Window

- `<leader>w-` - Split Horizontal
- `<leader>w\` - Split Vertical
- `<leader>wx` - Swap Windows
- `<leader>wK` / `<leader>wJ` / `<leader>wH` / `<leader>wL` - Move window
- `<leader>w=` - Rebalance
- `<leader>wo` - Close Other Windows
- `<leader>wt` - Move to New Tab

### Comments

- `\;` - Toggle Comment (normal/visual)

### Toggle

- `\w` - Toggle Whitespace
- `\r` - Toggle Relative Number
- `\s` - Toggle Spell Check
- `\o` - Toggle Read Only
- `\C` - Toggle Clipboard

### Fold

- `\fc` - Toggle Fold Column

### Debug

- `\dv` - Toggle Vim Verbose Log

### Log Levels

- `\lt` - Log TRACE
- `\ld` - Log DEBUG
- `\li` - Log INFO
- `\lw` - Log WARN
- `\le` - Log ERROR
- `\lo` - Log OFF

### Diff Mode

- `,dp` - Diff Put
- `,dg` - Diff Get
- `,dn` - Next Diff
- `,dN` - Prev Diff

### Menu Access

- `<leader>?` - Buffer Local Keymaps
- `<leader>a` - App Menu
- `<leader>b` - Buffer Menu
- `<leader>f` - File Menu
- `<leader>w` - Window Menu
- `<leader>v` - Vim Menu
- `<leader>Y` - Yank Menu
- `<leader>s` - Search Menu

### Indent Navigation

- `[l` / `]l` - Prev/Next indent
- `[L` / `]L` - Prev/Next lower indent

### Visual Mode

- `<C-j>` / `<C-k>` - Move selected lines down/up