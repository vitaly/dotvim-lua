<!-- lua/init/README.md -->

## requirements

- requires `gcc-12` to be installed

## packer

packer is not loaded by default. it is only loaded when we need to interact
with packer or plugins etc. on compile it produces a compiled plugins file,
which can be loaded next time without the packer.


## installation

<!-- lua/layers/ide/lsp/README.md -->
### LSP

LSP servers are managed with Mason (`<leader>amm`)

