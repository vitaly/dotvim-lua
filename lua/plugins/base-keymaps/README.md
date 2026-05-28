## Basic Keymaps

[which-key.nvim](https://github.com/folke/which-key.nvim)

### Navigation

| Key | Description |
|-----|-------------|
| `<tab><tab>` | Switch to last buffer |
| `<tab><space>` | New Tab |
| `j` / `k` | Move down/up (visual line) |
| `n` / `N` | Search next/prev and center |
| `*` / `#` | Search word under cursor forward/back |
| `g*` / `g#` | Search word (no word boundary) |

### Text Editing

| Key | Description |
|-----|-------------|
| `+` | Increment number |
| `-` | Decrement number |
| `<C-j>` / `<C-k>` | Move line down/up |
| `<` / `>` | Indent (in visual mode, keep selection) |
| `Q` | Format word (gq) |

### Save & Quit

| Key | Description |
|-----|-------------|
| `<space><space>` | Save |
| `<leader>q` | Quit All |
| `<leader>x` | Close Window |
| `<leader>QQ` | Quit All! |

### Buffer

| Key | Description |
|-----|-------------|
| `<leader>bn` | Next Buffer |
| `<leader>bp` | Prev Buffer |
| `<leader>bd` | Delete Buffer |

### File

| Key | Description |
|-----|-------------|
| `<leader>fs` | Save File |
| `<leader>fa` | Save All Files |
| `<leader>fx` | Make Executable |
| `<leader>fec` | Edit Config |
| `<leader>fei` | Edit init.lua |

### Window

| Key | Description |
|-----|-------------|
| `<leader>w-` | Split Horizontal |
| `<leader>w\` | Split Vertical |
| `<leader>wx` | Swap Windows |
| `<leader>wK` / `<leader>wJ` / `<leader>wH` / `<leader>wL` | Move window |
| `<leader>w=` | Rebalance |
| `<leader>wo` | Close Other Windows |
| `<leader>wt` | Move to New Tab |

### Comments

| Key | Description |
|-----|-------------|
| `\;` | Toggle Comment (normal/visual) |

### Toggle

| Key | Description |
|-----|-------------|
| `\w` | Toggle Whitespace |
| `\r` | Toggle Relative Number |
| `\s` | Toggle Spell Check |
| `\o` | Toggle Read Only |
| `\C` | Toggle Clipboard |

### Fold

| Key | Description |
|-----|-------------|
| `\fc` | Toggle Fold Column |

### Debug

| Key | Description |
|-----|-------------|
| `\dv` | Toggle Vim Verbose Log |

### Log Levels

| Key | Description |
|-----|-------------|
| `\lt` | Log TRACE |
| `\ld` | Log DEBUG |
| `\li` | Log INFO |
| `\lw` | Log WARN |
| `\le` | Log ERROR |
| `\lo` | Log OFF |

### Diff Mode

| Key | Description |
|-----|-------------|
| `,dp` | Diff Put |
| `,dg` | Diff Get |
| `,dn` | Next Diff |
| `,dN` | Prev Diff |

### Menu Access

| Key | Description |
|-----|-------------|
| `<leader>?` | Buffer Local Keymaps |
| `<leader>a` | App Menu |
| `<leader>b` | Buffer Menu |
| `<leader>f` | File Menu |
| `<leader>w` | Window Menu |
| `<leader>v` | Vim Menu |
| `<leader>Y` | Yank Menu |
| `<leader>s` | Search Menu |

### Indent Navigation

| Key | Description |
|-----|-------------|
| `[l` / `]l` | Prev/Next indent |
| `[L` / `]L` | Prev/Next lower indent |

### Visual Mode

| Key | Description |
|-----|-------------|
| `<C-j>` / `<C-k>` | Move selected lines down/up |