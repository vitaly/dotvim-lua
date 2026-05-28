# Base Colors

Color scheme management for Neovim.

## Plugins

- [tokyonight.nvim](https://github.com/folke/tokyonight.nvim) - Tokyo Night theme
- [nvim-base16](https://github.com/RRethy/nvim-base16) - Base16 theme support

## Keymaps

| Key | Description |
|-----|-------------|
| `<leader>vc` | Load colorscheme from `~/.vimrc_background` |

## Configuration

- Configurable via `colorscheme` option in Onion config
- Default: tokyonight
- when not set, LoadVimrcBackground will be called

## Notes

- `LoadVimrcBackground` command sources `~/.vimrc_background` for base16 themes
- Custom diff highlighting: adds colored backgrounds to diff modes
