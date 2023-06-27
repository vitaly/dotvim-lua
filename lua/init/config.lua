_G.my = _G.my or {}

my.root = vim.uv.fs_realpath(vim.fn.stdpath 'config')
vim.g.MY_ROOT = my.root

-- merge current my.config (if exists) over default config table
my.config = vim.tbl_deep_extend('force', {
  -- colorscheme name
  -- OR '--load' to load colorscheme from ~/.vimrc_background
  -- colorscheme = 'tokyonight',
  colorscheme = '-load',

  neotree = {
    -- position = 'right',
  },
}, my.config or {})
