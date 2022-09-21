

## requirements

- requires `gcc-11` to be installed

## packer

packer is not loaded by default. it is only loaded when we need to interact
with packer or plugins etc. on compile it produces a compiled plugins file,
which can be loaded next time without the packer.
