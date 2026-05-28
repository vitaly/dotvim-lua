# Editor Folding

Modern looking folding with arrows.

- [nvim-origami](https://github.com/chrisgrieser/nvim-origami)

## Features

- Arrow-based fold indicators in the sign column
- Folds enabled by default with fold level 99
- Uses Neovim's built-in folding (no external fold engine)

## Special Keymaps

[nvim-origami](https://github.com/chrisgrieser/nvim-origami) overloads `h`, `l`, `^`, and `$` for folding, letting you use them instead of `zc`/`zo`/`zC`/`zO`:

| Key | Description |
|-----|-------------|
| `h` | Folds the current line when used on the first non-blank character; otherwise behaves as normal `h` |
| `l` | Unfolds the cursorline when used on a folded line; otherwise behaves as normal `l` |
| `^` | Same as `h` but folds **recursively** (like `zC`) |
| `$` | Same as `l` but unfolds **recursively** (like `zO`) |
