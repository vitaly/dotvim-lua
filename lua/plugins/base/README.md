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