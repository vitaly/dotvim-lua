## GIT

- `SPACE-gs` - show git status
- `<SPACE-gp` - git push
- `<SPACE-gd` - git diff
- `<SPACE-gg` - git grep
- `<SPACE-gw` - git grep word under cursor
- `\\gs` - toggle gitsigns
- `\\gs` - toggle virtual git blame for current line

## Git Status Mode

- `g?` - help

changes:

- `-` - toggle stage / unstage of file or hunk
- 'X' - discard file changes or hunk
- `=` - toggle inline diff

commit:

- 'cc' - commit
- 'ca' - amend commit
- 'cf' rt- commit `--fixup` for file under cursor
- 'cF' - commit `--fixup` for file under cursor and immediately rebase it

rebase:

- `ri` - interactive rebase from ancestore of commit under the cursor
- `rr` - continue rebase
- `rs` - skip the current commit and continue rebase
- `ra` - abort rebase
- `rw` - interactive rebase with the commit under the cursor set to `reword`.
- `rm` - interactive rebase with the commit under the cursor set to `edit`.
- `rd` - interactive rebase with the commit under the cursor set to `drop`.
