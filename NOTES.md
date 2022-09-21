

## TODO

- [x] basic maps
- [ ] basic mapping support for lua
- [ ] colors
- [ ] autoformating setup
- [ ] which-key setup
- [ ] filer
- [ ] fuzzy
- [ ] LSP








## packer


### packer is compiled into `packer_compiled.lua`, duh!

- `packer.nvim` package is placed into `pack/packer/opt`
- so it's not supposed to be available for `require('packer')`
- but... if packer was compiled, a compiled version of it will be included into the compiled file
- still, since everything must work even when compiled file was removed, and
  (possibly) fails to recompile on startup, proper handling must be done to
  ensure this package can be properly loaded to fix the problem



