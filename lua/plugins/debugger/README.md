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

| Key | Description |
|-----|-------------|
| `<leader>db` | Toggle breakpoint |
| `\\b` | Toggle breakpoint |
| `<leader>dB` | Set conditional breakpoint |
| `<leader>dc` | Continue |
| `<leader>dC` | Run to cursor |
| `<leader>dg` | Go to line (no execute) |
| `<leader>di` | Step into |
| `<leader>do` | Step out |
| `<leader>dO` | Step over |
| `<leader>dl` | Run last |
| `<leader>dp` | Pause |
| `<leader>dj` | Go down (call stack) |
| `<leader>dk` | Go up (call stack) |
| `<leader>dr` | Toggle REPL |
| `<leader>ds` | Show session |
| `<leader>dt` | Terminate |
| `<leader>dw` | Show widgets (hover) |

### UI

| Key | Description |
|-----|-------------|
| `<leader>du` | Toggle Dap UI |
| `<leader>de` | Eval (visual mode) |

### Lua Adapter

| Key | Description |
|-----|-------------|
| `<leader>dal` | Launch Lua server adapter (port 8086) |