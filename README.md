<!-- lua/plugins/base-colors/README.md -->
## Color Schemes

Use config.colorschemes to define default colorscheme name

"base16" and "tokyonight" themes are pre-installed.

You can add another theme module in `lua/plugins/base/colors.lua`.

`LoadVimrcBackground` command will source `~/.vimrc_background` file that is created by "base16" shell.

`<leader>vc` - to call `LoadVimrcBackground`

<!-- lua/plugins/base-keymaps/README.md -->

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

<!-- lua/plugins/editor-surround/README.md -->
## Surround

We are using https://github.com/echasnovski/mini.surround for surround.
Default mappings are changed slightly to be more like those of tpope's `vim-surround`: https://github.com/tpope/vim-surround

- `ys` - add
- `ds` - remove
- `cs` - change

<!-- lua/plugins/git/README.md -->
## GIT

- `SPACE-gs` - show git status
- `<SPACE-gp` - git push
- `<SPACE-gd` - git diff
- `<SPACE-gg` - git grep
- `<SPACE-gw` - git grep word under cursor
- `\\gs` - toggle gitsigns
- `\\gs` - toggle virtual git blame for current line

