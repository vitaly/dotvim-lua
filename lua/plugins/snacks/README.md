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

| Key | Description |
|-----|-------------|
| `<leader>ass` | Open Snacks picker |
| `<leader>asf` | Find file |
| `<leader>aso` | Recent files |
| `<leader>asO` | Smart files |
| `<leader>asF` | Git files |
| `<leader>asb` | Buffers |

### Search

| Key | Description |
|-----|-------------|
| `<leader>as//` | Grep |
| `<leader>as/w` | Grep word |
| `<leader>as/b` | Grep buffers |
| `<leader>as/g` | Grep git |

### History

| Key | Description |
|-----|-------------|
| `<leader>as:` | Command history |
| `<leader>as?` | Search history |
| `<leader>asn` | Notifications |

### Commands

| Key | Description |
|-----|-------------|
| `<leader>asc` | Commands |
| `<leader>asC` | Colorschemes |
| `<leader>asL` | Buffer lines |
| `<leader>asa` | Autocommands |

### Diagnostics

| Key | Description |
|-----|-------------|
| `<leader>asd` | Buffer diagnostics |
| `<leader>asD` | All diagnostics |

### Navigation

| Key | Description |
|-----|-------------|
| `<leader>ash` | Help |
| `<leader>asH` | Highlights |
| `<leader>asi` | Icons |
| `<leader>asj` | Jump |
| `<leader>ask` | Keymaps |
| `<leader>asz` | Lazy |
| `<leader>asm` | Man pages |
| `<leader>as'` | Marks |
| `<leader>asq` | Quickfix |
| `<leader>asQ` | Loclist |
| `<leader>asr` | Register |
| `<leader>asR` | Resume |
| `<leader>ast` | Todo |
| `<leader>asu` | Undo |
| `<leader>asp` | Project |

### Git

| Key | Description |
|-----|-------------|
| `<leader>asGb` | Branches |
| `<leader>asGl` | Log |
| `<leader>asGL` | Log line |
| `<leader>asGf` | Log file |
| `<leader>asGs` | Status |
| `<leader>asGS` | Stash |
| `<leader>asGd` | Diff |

### LSP

| Key | Description |
|-----|-------------|
| `<leader>asld` | Definition |
| `<leader>aslD` | Declaration |
| `<leader>aslr` | References |
| `<leader>asli` | Implementation |
| `<leader>aslt` | Type definition |
| `<leader>aslI` | Incoming calls |
| `<leader>aslO` | Outgoing calls |
| `<leader>asls` | Document symbols |
| `<leader>aslw` | Workspace symbols |
| `<leader>aslc` | LSP config |

### Scratch

| Key | Description |
|-----|-------------|
| `<leader>#` | New scratch file |
| `<leader>$` | Select scratch file |

### Other

| Key | Description |
|-----|-------------|
| `\i` | Toggle indent scope |

## Configuration

Custom checkbox icons:
- Unchecked: ` `
- Checked: ` `
- Todo: `[-]` → ` `
- Exclamation: `[!]` → `󱈸 `
- Tilda: `[~]` → `󰜥 `
- Angle: `[>]` → ` `
- Star: `[*]` → ` `