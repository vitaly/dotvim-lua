## AutoFormat

[conform.nvim](https://github.com/stevearc/conform.nvim)

### Keymaps

| Key | Description |
|-----|-------------|
| `<localleader>af` | Format |
| `<localleader>ai` | Format Info |
| `\aa` | Toggle AutoFormat |
| `\ab` | Toggle Buffer AutoFormat |
| `\af` | Toggle Filetype AutoFormat |

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