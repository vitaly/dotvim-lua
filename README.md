<!-- lua/init/README.md -->

## requirements

- requires `gcc-12` to be installed

## packer

packer is not loaded by default. it is only loaded when we need to interact
with packer or plugins etc. on compile it produces a compiled plugins file,
which can be loaded next time without the packer.


## installation

<!-- lua/layers/base/keymaps/README.md -->
## Basic Keymaps

- `<SPACE>m` - show messages
- `<SPACE>M` - clear messages

- `<SPACE>x` - quite window
- `<SPACE>q` - quite all
- `<SPACE>Q` - quite all!

- `<SPACE>n` - Next
- `<SPACE>p` - Prev

- `<SPACE>a` - Show Apps Menu
- `<SPACE>b` - Show Buffer Menu
- `<SPACE>f` - Show File Menu
- `<SPACE>w` - Show Window Menu
- `<SPACE>s` - Show Status Menu
- `<SPACE>t` - Show Tab Menu
- `<SPACE>v` - Show Vim Menu
- `<SPACE>Y` - Show Yank Menu

- `,<SPACE>` - Save
- `,e` - Show Eval Menu

- `\` - Show Toggle Menu

### in diff-mode

- `,d` - Show Diff Menu

<!-- lua/layers/cursors/README.md -->
# Multiple Cursors

https://github.com/mg979/vim-visual-multi

`ctrl-n` - to select words
`n` - select next
`q` - skip

`tab` - toggle cursor and extend mode

<!-- lua/layers/ide/cmp/copilot/README.md -->
## Github Copilot

- `<C-]>` - Dismiss the current suggestion.
- `<M-]>` - Cycle to the next suggestion, if one is available.
- `<M-[>` - Cycle to the previous suggestion.
- `<M-\>` - Explicitly request a suggestion, even if Copilot

<!-- lua/layers/ide/format/README.md -->
## Formatting

Generic formatting is provided by `null-ls` (https://github.com/jose-elias-alvarez/null-ls.nvim).

A generic LSP server that can use external tools to provide LSP
'formatting' and 'diagnostic' capabilities.

To show `null-ls` status: `<leader>sn`

TBD cycle config

<!-- lua/layers/ide/lsp/README.md -->
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

