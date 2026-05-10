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