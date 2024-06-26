_G.my = _G.my or {}

my.root = vim.uv.fs_realpath(vim.fn.stdpath 'config')
vim.g.MY_ROOT = my.root

-- merge current my.config (if exists) over default config table
my.config = vim.tbl_deep_extend('force', {
  loglevel = vim.log.levels.DEBUG,
  -- loglevel = vim.log.levels.TRACE,

  -- colorscheme name
  -- OR '-load' to load colorscheme from ~/.vimrc_background
  colorscheme = 'tokyonight-night',
  -- colorscheme = '-load', -- FIXME: I don't like this magic value

  neotree = {
    position = 'left',
  },

  icons = {
    diagnostics = { Error = ' ', Warn = ' ', Hint = '󰌶 ', Info = ' ' },
    dap = {
      Stopped = { '󰁕 ', 'DiagnosticWarn', 'DapStoppedLine' },
      Breakpoint = ' ',
      BreakpointCondition = '',
      BreakpointRejected = { '', 'DiagnosticError' },
      LogPoint = '.>',
    },
  },

  lua = {
    add_plugins_to_workspace = false,
  },

  tagbar = {
    position = 'right',
  },
}, my.config or {})
