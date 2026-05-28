## LSP

[mason.nvim](https://github.com/mason-org/mason.nvim)
[nvim-lspconfig](https://github.com/neovim/nvim-lspconfig)

### Mason (Package Manager)

| Key | Description |
|-----|-------------|
| `<leader>amm` | Open Mason |
| `<leader>aml` | Mason Log |
| `<leader>amu` | Mason Update |
| `<leader>ami` | Mason Install... |

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