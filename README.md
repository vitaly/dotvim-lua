<!-- lua/plugins/base-colors/README.md -->
# Base Colors

Color scheme management for Neovim.

## Plugins

- [tokyonight.nvim](https://github.com/folke/tokyonight.nvim) - Tokyo Night theme
- [nvim-base16](https://github.com/RRethy/nvim-base16) - Base16 theme support

## Keymaps

- `<leader>vc` - Load colorscheme from `~/.vimrc_background`

## Configuration

- Configurable via `colorscheme` option in Onion config
- Default: tokyonight
- when not set, LoadVimrcBackground will be called

## Notes

- `LoadVimrcBackground` command sources `~/.vimrc_background` for base16 themes
- Custom diff highlighting: adds colored backgrounds to diff modes

<!-- lua/plugins/base-keymaps/README.md -->
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
<!-- lua/plugins/base-lazy/README.md -->
# Base Lazy

Plugin manager for Neovim.

- [lazy.nvim](https://github.com/folke/lazy.nvim)

Manages lazy loading of plugins and itself. Keys are defined in `base-keymaps`.
<!-- lua/plugins/base-notifications/README.md -->
## Notifications

[Noice](https://github.com/folke/noice.nvim) plugin.

### Keymaps

- `<leader>mm` - All Messages
- `<leader>me` - Error Messages
- `<leader>m/` - Search Messages
- `<leader>m?` - Last Messages
- `<leader>mD` - Disable Noice
- `<leader>mE` - Enable Noice
- `<leader>mc` - Clear History
- `<leader>mT` - Toggle Noice
- `\\m` - Toggle Noice
- `<leader>mt` - Print Trace Log
- `<leader>mg` - Generate Test Messages
- `<esc><esc>` - Dismiss All

<!-- lua/plugins/base-utils/README.md -->
# Base Utils

Utility dependencies for other plugins.

- [plenary.nvim](https://github.com/nvim-lua/plenary.nvim) - Common utilities
- [nvim-web-devicons](https://github.com/nvim-tree/nvim-web-devicons) - File icons
- [nui.nvim](https://github.com/MunifTanjim/nui.nvim) - UI components
- [mini.icons](https://github.com/nvim-mini/mini.icons) - Minimal icons
<!-- lua/plugins/base/README.md -->
# Base

Core plugins and configuration for Neovim.

## Plugins

- [glue.nvim](https://github.com/vitaly/glue.nvim) - Event/action system
- [onion.nvim](https://github.com/vitaly/onion.nvim) - Configuration management
- [onion-ui.nvim](https://github.com/vitaly/onion-ui.nvim) - UI for onion config
- [lazydev.nvim](https://github.com/folke/lazydev.nvim) - Lua development support

## Keymaps

### Onion Config

- `<leader>aoe` - Edit config
- `<leader>aos` - Save config
- `<leader>aoi` - Show config
- `<leader>aol` - Load config
- `<leader>aod` - Show default config
- `<leader>aou` - Show user config

### Other

- `<leader>aoo` - Open Onion UI
- `<leader>ao` - Onion group

## Configuration

- Auto-save enabled
- Config path: `config.lua` in config directory
- Default log level: WARN
<!-- lua/plugins/code-completion/README.md -->
## Code Completion

### Backend

[blink.cmp](https://github.com/saghen/blink.cmp) (default) or nvim-cmp.

- `config.code-completion.backend` - 'blink' (default) or 'cmp'

### Blink.cmp (default)

[blink.cmp](https://github.com/saghen/blink.cmp) with [copilot.lua](https://github.com/zbirenbaum/copilot.lua) and [LuaSnip](https://github.com/L3MON4D3/LuaSnip).

### Keymaps

- `<Tab>` - Accept suggestion / snippet forward / copilot accept
- `<M-w>` - Accept word
- `<M-l>` - Accept line
- `<M-]>` - Next suggestion
- `<M-[>` - Prev suggestion
- `<C-]>` - Dismiss
- `<C-j>` / `<C-k>` - Select next/prev

### Snippets

[LuaSnip](https://github.com/L3MON4D3/LuaSnip) with [friendly-snippets](https://github.com/rafamadriz/friendly-snippets).

- `<Tab>` (in insert mode) - Jump to next snippet placeholder
- `<S-Tab>` - Jump to previous snippet placeholder

### Copilot

[copilot.lua](https://github.com/zbirenbaum/copilot.lua) with copilot-lsp.

- `<leader>aci` - Copilot Status
- `<leader>acp` - Copilot Panel
<!-- lua/plugins/code-navigation/README.md -->
## Code Navigation

### Symbols Outline

[outline.nvim](https://github.com/hedyhli/outline.nvim)

- `\]` - Toggle Symbols Outline

### Aerial

[aerial.nvim](https://github.com/stevearc/aerial.nvim)

Shows code structure via Telescope popup.

- `go` - Fuzzy Outline (Telescope)

### Configuration

- `config.tagbar.position` - 'left' or 'right' (default)
<!-- lua/plugins/debugger/README.md -->
# Debugger

Debug adapter protocol (DAP) integration for Neovim.

## Plugins

- [nvim-dap](https://github.com/mfussenegger/nvim-dap) - Debug adapter protocol client
- [nvim-dap-ui](https://github.com/rcarriga/nvim-dap-ui) - UI for nvim-dap
- [nvim-dap-virtual-text](https://github.com/theHamsta/nvim-dap-virtual-text) - Virtual text support
- [mason-nvim-dap.nvim](https://github.com/jay-babu/mason-nvim-dap.nvim) - DAP adapter installer
- [one-small-step-for-vimkind](https://github.com/jbyuki/one-small-step-for-vimkind) - Lua adapter

## Configuration

### Debug Adapters

Configured via `debugger.ensure_installed`:

- `bash` - Bash debugger
- `go` - Go debugger (Delve)
- Other adapters available: chrome, delve, elixir, js, kotlin, node2, python

## Keymaps

### General

- `<leader>db` - Toggle breakpoint
- `\\b` - Toggle breakpoint
- `<leader>dB` - Set conditional breakpoint
- `<leader>dc` - Continue
- `<leader>dC` - Run to cursor
- `<leader>dg` - Go to line (no execute)
- `<leader>di` - Step into
- `<leader>do` - Step out
- `<leader>dO` - Step over
- `<leader>dl` - Run last
- `<leader>dp` - Pause
- `<leader>dj` - Go down (call stack)
- `<leader>dk` - Go up (call stack)
- `<leader>dr` - Toggle REPL
- `<leader>ds` - Show session
- `<leader>dt` - Terminate
- `<leader>dw` - Show widgets (hover)

### UI

- `<leader>du` - Toggle Dap UI
- `<leader>de` - Eval (visual mode)

### Lua Adapter

- `<leader>dal` - Launch Lua server adapter (port 8086)
<!-- lua/plugins/development/README.md -->
## Development Tools

### Xterm Color Table

[xterm-color-table.vim](https://github.com/guns/xterm-color-table.vim)

- `<leader>SX` - Show Xterm Color Table
- `:XtermColorTable` - Show table
<!-- lua/plugins/editor-colors/README.md -->
## Editor Colors

### Colorizer

[nvim-colorizer.lua](https://github.com/NvChad/nvim-colorizer.lua)

Highlights color codes in text.

- `\Lc` - Toggle Colorizer
- `\Lm` - Toggle Colorizer Mode
- `\Lr` - Reload Colorizer

Modes: virtualtext, foreground, background

### Interesting Words

[vim-interestingwords](https://github.com/lfv89/vim-interestingwords)

Colors words by request.

- `<leader>k` - Toggle color for the word under cursor
- `<leader>K` - Remove all word colors
- `n` / `N` - Go to next/prev colored word or search result
<!-- lua/plugins/editor-folding/README.md -->
# Editor Folding

Modern looking folding with arrows.

- [nvim-origami](https://github.com/chrisgrieser/nvim-origami)

## Features

- Arrow-based fold indicators in the sign column
- Folds enabled by default with fold level 99
- Uses Neovim's built-in folding (no external fold engine)

<!-- lua/plugins/editor-format/README.md -->
## AutoFormat

[conform.nvim](https://github.com/stevearc/conform.nvim)

### Keymaps

- `<localleader>af` - Format
- `<localleader>ai` - Format Info
- `\aa` - Toggle AutoFormat
- `\ab` - Toggle Buffer AutoFormat
- `\af` - Toggle Filetype AutoFormat

### Commands

- `:Format` - Format current buffer
- `:FormatToggle` - Toggle autoformat globally
- `:FormatInfo` - Show formatting info

### Supported Formatters

- **Lua**: stylua
- **JavaScript/JSON**: prettier
- **Bash/Sh**: shfmt, beautysh

### Configuration

- `config.autoformat.enabled` - Enable/disable autoformat (default: true)
- `config.autoformat.filetypes.<ft>.enabled` - Per-filetype toggle
- `config.conform.stop_after_first` - Stop after first formatter (default: true)
<!-- lua/plugins/editor/README.md -->
## Editor Enhancements

### Bookmarks

[vim-bookmarks](https://github.com/MattesGroeger/vim-bookmarks)

- `mm` - Toggle Bookmark
- `mc` - Clear Bookmarks in Buffer
- `mx` - Clear Bookmark in All Buffers
- `mn` - Next Bookmark
- `mp` - Prev Bookmark
- `ma` - Show All Bookmarks
- `mi` - Add Bookmark Annotation
- `mkk` / `mjj` - Move Bookmark Up/Down

### Undo Tree

[undotree](http://github.com/mbbill/undotree)

- `\u` - Toggle Undo Tree
- `g=` - Go to newer text state

### Switch

[switch.vim](https://github.com/AndrewRadev/switch.vim)

- `gs` - Switch (e.g., `true` <=> `false`)

### Align

[mini.align](https://github.com/nvim-mini/mini.align)

- `gA` - Start Align in Preview Mode

### Surround

[mini.surround](https://github.com/nvim-mini/mini.surround)

- `ys` - Add Surrounding
- `ds` - Delete Surrounding
- `cs` - Change Surrounding

### Pairs

[mini.pairs](https://github.com/nvim-mini/mini.pairs)

Automatic pairing of brackets and quotes.

### Zen Mode

[twilight.nvim](https://github.com/folke/twilight.nvim) - Focus mode

- `\F` - Focus (dimm everything except area around cursor)

[zen-mode.nvim](https://github.com/folke/zen-mode.nvim) - Zen mode

- `\<tab>` - Zen Mode (focus, zoom, and center)

### Multiple Cursors

[vim-visual-multi](https://github.com/mg979/vim-visual-multi)

- `<localleader>v` - Visual Multi Menu
- `Ctrl-n` - Select words
- `n` - Select next
- `q` - Skip
- `Ctrl-down` - Add vertical cursor
- `Tab` - Toggle cursor and extend mode

### Illuminate

[vim-illuminate](https://github.com/RRethy/vim-illuminate)

Highlights other uses of the word under cursor.

- `<m-i>` - Textobject for reference under cursor
- `<m-n>` - Go to next occurrence
- `<m-p>` - Go to prev occurrence

### Yank Ring

[yanky.nvim](https://github.com/gbprod/yanky.nvim)

- `p` / `P` - Paste after/before
- `gp` / `gP` - Paste after/before (cursor stays)
- `]y` / `[y` - Cycle through yanks
- `<leader>Y<CR>` - Yank History

### Global Search and Replace

[grug-far.nvim](https://github.com/MagicDuck/grug-far.nvim)

- `<leader>sr` - Search and Replace

### Status Column

[statuscol.nvim](https://github.com/luukvbaal/statuscol.nvim)

Shows line numbers, fold indicators, and signs.

### Venn Diagrams

[venn.nvim](https://github.com/jbyuki/venn.nvim)

- `\V` - Toggle Venn Mode (draw boxes in visual mode)

### Window Zoom

[zoomwintab.vim](https://github.com/troydm/zoomwintab.vim)

- `\z` - Toggle Window Zoom
<!-- lua/plugins/file-tree/README.md -->
## File Tree

[nvim-tree](https://github.com/nvim-tree/nvim-tree.lua)
[neo-tree](https://github.com/nvim-neo-tree/neo-tree.nvim)

Uses snacks file tree by default.

### Keymaps

- `\\` - Quick File Popup
- `\[` - Toggle File Tree
- `\.` - Reveal Current File

### Configuration

- `config.file-tree.plugin` - Backend: 'snacks' (default), 'neotree', or 'nvimtree'
- `config.file-tree.position` - 'left' (default) or 'right'
<!-- lua/plugins/git/README.md -->
## Git

[gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim)
[vim-fugitive](https://github.com/tpope/vim-fugitive)

### Gitsigns

- `\gs` - Toggle Signs
- `\gv` - Toggle Virtual Line Blame
- `\gl` - Toggle Line Highlight
- `\gw` - Toggle Word Diff

### Fugitive

- `<leader>gs` - Git Status
- `<leader>gd` - Git Diff (vertical)
- `<leader>gp` - Git Push
- `<leader>gg` - Git Grep...
- `<leader>gw` - Git Grep Word

### Git Status Mode

- `g?` - Help

**Changes:**
- `-` - Stage/unstage file or hunk
- `X` - Discard changes

**Commit:**
- `cc` - Commit
- `ca` - Amend commit
- `cf` - Fixup commit
- `cF` - Fixup and rebase

**Rebase:**
- `ri` - Interactive rebase
- `rr` - Continue
- `rs` - Skip
- `ra` - Abort
- `rw` - Reword
- `rm` - Edit
- `rd` - Drop
<!-- lua/plugins/lsp-null/README.md -->
# LSP Null

External LSP tools (linting, formatting).

- [none-ls.nvim](https://github.com/nvimtools/none-ls.nvim)
- [mason-null-ls.nvim](https://github.com/jayp0521/mason-null-ls.nvim)

## Status

**Currently disabled** (`enabled = false`).

## Keymaps

- `<leader>Sn` - Null LS info
- `<leader>ani` - Null LS info
- `<leader>anl` - Null LS log

## Available Sources

- rubocop (diagnostics)
- shellcheck (diagnostics)

## Configuration

- Border: single
- Group: `<leader>an`
<!-- lua/plugins/lsp/README.md -->
## LSP

[mason.nvim](https://github.com/mason-org/mason.nvim)
[nvim-lspconfig](https://github.com/neovim/nvim-lspconfig)

### Mason (Package Manager)

- `<leader>amm` - Open Mason
- `<leader>aml` - Mason Log
- `<leader>amu` - Mason Update
- `<leader>ami` - Mason Install...

### Default LSP Servers

- lua_ls, ts_ls, jsonls, yamlls, bashls, dockerls, ruby_lsp

### Tools

- [fidget.nvim](https://github.com/j-hui/fidget.nvim) - LSP progress
- [nvim-lightbulb](https://github.com/kosayoda/nvim-lightbulb) - Code action indicator

### Configuration

- `config.lsp.ensure_installed` - Tools to install (jq, stylua, tree-sitter-cli)
- `config.lsp.enable` - LSP servers to enable
- `config.lsp.servers` - Server-specific config
- `config.icons.diagnostic` - Diagnostic icons
<!-- lua/plugins/obsidian/README.md -->
# Obsidian

Obsidian.md integration for Neovim.

- [obsidian.nvim](https://github.com/obsidian-nvim/obsidian.nvim)
- [render-markdown.nvim](https://github.com/MeanderingProgrammer/render-markdown.nvim)

## Configuration

### Workspaces

- `main` - ~/Obsidian/Main

### Features

- Markdown rendering with icons
- Custom checkbox states: ` `, `x`, `*`, `~`, `!`, `>`
- LSP completions enabled
- Anti-conceal for code blocks, quotes

### Checkbox Icons

- Unchecked: ` `
- Checked: ` `
- Todo `[-]`: ` `
- Exclamation `[!]`: `󱈸 `
- Tilda `[~]`: `󰜥 `
- Angle `[>]`: ` `
- Star `[*]`: ` `
<!-- lua/plugins/picker/README.md -->
# Picker

Unified picker keybindings using Snacks and Telescope.

## Keymaps

### Quick Access

- `<localleader><localleader>` - Find file
- `<leader>/` - Grep in files
- `<leader><cr>` - Find command
- `<leader>:` - Search command history

### Help

- `??` - Find help
- `?k` - Find keymaps
- `?m` - Man pages (Telescope)

### Files & Buffers

- `<leader>ff` - Find file
- `<leader>bb` - Find buffer

### Search & Diagnostics

- `<leader>sd` - Buffer diagnostics
- `<leader>sD` - All diagnostics
- `<leader>sw` - Search word
- `<leader>st` - Search TODOs
- `<leader>sp` - Find project

## Notes

Combines Snacks picker (primary) with Telescope as fallback for some actions.
<!-- lua/plugins/refactoring/README.md -->
# Refactoring

Code refactoring tools for Neovim.

- [refactoring.nvim](https://github.com/ThePrimeagen/refactoring.nvim)

## Keymaps

All keymaps use `<localleader>r` prefix.

### Rename

- `<localleader>rn` - Rename

### Select Refactor

- `<localleader>rr` - Select refactor (normal & visual)

### Extract

- `<localleader>ref` - Extract function
- `<localleader>reF` - Extract function to file
- `<localleader>rev` - Extract variable

### Inline

- `<localleader>rif` - Inline function
- `<localleader>riv` - Inline variable

<!-- lua/plugins/session/README.md -->
## Sessions

[persistence.nvim](https://github.com/folke/persistence.nvim)

### Keymaps

- `<leader>Qr` - Restore Session
- `<leader>Ql` - Restore Last Session
- `<leader>Qd` - Don't Save Current Session

### Features

- Automatically saves session on exit
- Restores buffers, directory, tabs, and window size
<!-- lua/plugins/snacks/README.md -->
# Snacks

Utility enhancements for Neovim.

- [snacks.nvim](https://github.com/folke/snacks.nvim)
- [todo-comments.nvim](https://github.com/folke/todo-comments.nvim)

## Features

- **dashboard** - Startup dashboard with projects
- **explorer** - File explorer
- **picker** - Unified picker UI
- **notifier** - Notification UI
- **quickfile** - Quick file access
- **scope** - Scope highlighting
- **bigfile** - Big file handling
- **debug** - Debug utilities
- **input** - Input enhancements
- **scratch** - Scratch file support

## Keymaps

All keymaps use `<leader>as` prefix.

### General

- `<leader>ass` - Open Snacks picker
- `<leader>asf` - Find file
- `<leader>aso` - Recent files
- `<leader>asO` - Smart files
- `<leader>asF` - Git files
- `<leader>asb` - Buffers

### Search

- `<leader>as//` - Grep
- `<leader>as/w` - Grep word
- `<leader>as/b` - Grep buffers
- `<leader>as/g` - Grep git

### History

- `<leader>as:` - Command history
- `<leader>as?` - Search history
- `<leader>asn` - Notifications

### Commands

- `<leader>asc` - Commands
- `<leader>asC` - Colorschemes
- `<leader>asL` - Buffer lines
- `<leader>asa` - Autocommands

### Diagnostics

- `<leader>asd` - Buffer diagnostics
- `<leader>asD` - All diagnostics

### Navigation

- `<leader>ash` - Help
- `<leader>asH` - Highlights
- `<leader>asi` - Icons
- `<leader>asj` - Jump
- `<leader>ask` - Keymaps
- `<leader>asz` - Lazy
- `<leader>asm` - Man pages
- `<leader>as'` - Marks
- `<leader>asq` - Quickfix
- `<leader>asQ` - Loclist
- `<leader>asr` - Register
- `<leader>asR` - Resume
- `<leader>ast` - Todo
- `<leader>asu` - Undo
- `<leader>asp` - Project

### Git

- `<leader>asGb` - Branches
- `<leader>asGl` - Log
- `<leader>asGL` - Log line
- `<leader>asGf` - Log file
- `<leader>asGs` - Status
- `<leader>asGS` - Stash
- `<leader>asGd` - Diff

### LSP

- `<leader>asld` - Definition
- `<leader>aslD` - Declaration
- `<leader>aslr` - References
- `<leader>asli` - Implementation
- `<leader>aslt` - Type definition
- `<leader>aslI` - Incoming calls
- `<leader>aslO` - Outgoing calls
- `<leader>asls` - Document symbols
- `<leader>aslw` - Workspace symbols
- `<leader>aslc` - LSP config

### Scratch

- `<leader>#` - New scratch file
- `<leader>$` - Select scratch file

### Other

- `\i` - Toggle indent scope

## Configuration

Custom checkbox icons:
- Unchecked: ` `
- Checked: ` `
- Todo: `[-]` → ` `
- Exclamation: `[!]` → `󱈸 `
- Tilda: `[~]` → `󰜥 `
- Angle: `[>]` → ` `
- Star: `[*]` → ` `
<!-- lua/plugins/statusline/README.md -->
## Status Line

[lualine.nvim](https://github.com/nvim-lualine/lualine.nvim)

### Keymaps

- `\S` - Toggle Status Line

### Features

- Shows mode, branch, diff, diagnostics
- Shows filename with path
- Shows encoding, fileformat, filetype
- Shows LSP client name
- Tabline shows tabs
- Winbar shows current file path

### Disabled Filetypes

- dap-repl, dapui_*
- Outline
- snacks_picker_list
- toggleterm
<!-- lua/plugins/telescope/README.md -->
# Telescope

Fuzzy finder and picker for Neovim.

- [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim)
- [telescope-symbols.nvim](https://github.com/nvim-telescope/telescope-symbols.nvim)

## Keymaps

All keymaps use `<leader>at` prefix.

### General

- `<leader>att` - Open Telescope
- `<leader>atf` - Find file
- `<leader>ato` - Recent files
- `<leader>atF` - Git files
- `<leader>atb` - Buffers
- `<leader>at//` - Grep
- `<leader>at/w` - Grep word
- `<leader>at:` - Command history
- `<leader>atc` - Commands
- `<leader>atC` - Colorschemes
- `<leader>atL` - Buffer lines
- `<leader>ata` - Autocommands

### Diagnostics

- `<leader>atd` - Buffer diagnostics
- `<leader>atD` - All diagnostics

### Help & Navigation

- `<leader>ath` - Help tags
- `<leader>atH` - Highlights
- `<leader>ati` - Icons
- `<leader>atk` - Keymaps
- `<leader>atm` - Man pages
- `<leader>at'` - Marks
- `<leader>ats` - Tagstack
- `<leader>atv` - Vim options

### Git

- `<leader>atGl` - Git log
- `<leader>atGs` - Git status

### LSP

- `<leader>atld` - Definition
- `<leader>atlD` - Declaration
- `<leader>atlr` - References
- `<leader>atli` - Implementation
- `<leader>atlt` - Type definition
- `<leader>atlI` - Incoming calls
- `<leader>atlO` - Outgoing calls
- `<leader>atls` - Document symbols
- `<leader>atlw` - Workspace symbols
- `<leader>atlW` - Dynamic workspace symbols

## Configuration

- Theme: ivy (for most pickers)
- Layout: flex
- Mappings: `<esc>` to close, `<c-j>`/`<c-k>` to navigate
<!-- lua/plugins/terminal/README.md -->
## Terminal

[toggleterm.nvim](https://github.com/akinsho/toggleterm.nvim)
[vim-tmux-navigator](https://github.com/christoomey/vim-tmux-navigator)

### Keymaps

- `<c-\>` - Toggle Terminal
- `<esc><esc>` - Exit Terminal to Normal Mode
- `<leader>gt` - Toggle TIG
- `<leader>gl` - Toggle LazyGit

### Tmux Navigation

- `<m-k>` / `<m-j>` / `<m-h>` / `<m-l>` - Navigate Up/Down/Left/Right
- `<leader>wk` / `<leader>wj` / `<leader>wh` / `<leader>wl` - Navigate (in normal mode)

### Features

- Terminal opens in insert mode automatically
- Mouse clicks re-enter insert mode
<!-- lua/plugins/testing/README.md -->
## Testing

[neotest](https://github.com/nvim-neotest/neotest) with vim-test integration.

### Keymaps

- `<leader>tn` - Test Nearest
- `<leader>tf` - Test File
- `<leader>ta` - Test All
- `<leader>tl` - Test Last
- `<leader>ts` - Stop

### Debug

- `<leader>tdn` - Debug Nearest
- `<leader>tdf` - Debug File

### Output

- `<leader>tp` - Toggle Output Panel
- `<leader>to` - Output
- `<leader>tL` - Output (Last)
- `<leader>tC` - Clear Output Panel

### Summary

- `<leader>tu` - Toggle Summary

### Watch

- `<leader>tw` - Watch on Save (simple)
- `<leader>tWf` - Watch File (LSP)
- `<leader>tWn` - Watch Nearest (LSP)

### Navigation

- `[t` - Prev Failed Test
- `]t` - Next Failed Test
<!-- lua/plugins/treesitter/README.md -->
# Treesitter

Syntax highlighting and parsing for Neovim.

- [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter)
- [nvim-treesitter-endwise](https://github.com/RRethy/nvim-treesitter-endwise)

## Features

- Syntax highlighting
- Incremental selection
- Text objects
- Matchup highlighting
- End-wise expansion

## Keymaps

- `<leader>ati` - Install info
- `<leader>atm` - Module info
- `<leader>atc` - Config info
- `<leader>atu` - Update parsers
- `<leader>ath` - vim.treesitter health
- `<leader>atH` - nvim-treesitter health

### Incremental Selection

- `<c-space>` - Init/increment selection
- `<bs>` - Decrement selection

## Installed Parsers

bash, c, comment, cpp, css, elixir, go, html, javascript, jsdoc, json, latex, lua, make, markdown_inline, markdown, python, query, regex, ruby, rust, scala, scss, toml, typescript, vim, yaml
<!-- lua/plugins/ui/README.md -->
# UI

UI enhancements for Neovim.

- [dressing.nvim](https://github.com/stevearc/dressing.nvim) - Improved UI for inputs and selections
