## LSP

LSP is setup using several plugins:


### `nvim-lspconfig`

> https://github.com/neovim/nvim-lspconfig

setup in `lua/layers/ide/lsp/core/init.lua`.

To configure an LSP server:

```lua
require('lspconfig').SERVER_NAME.setup(settings)
```

`lspconfig` already has default setups for a lot of servers.
The passed `settings` are merged with the defaults.


### Mason

Server Installation is handeled by Mason.

https://github.com/williamboman/mason.nvim

To bring up the menu do `<leader>amm`

Mason and LSPConfig use different names for same LSP servers.

For example, LSPConfig uses `tserver` where Mason uses `typescript-language-server`

To help with that se use `mason-lspconfig.nvim` (https://github.com/williamboman/mason-lspconfig.nvim)
It translates names between LSPConfig and Mason, and also provides hooks
that are called when server is installed, allowing to customize LSP config.
