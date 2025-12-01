_G.my = _G.my or {}

_G.R = function(mod)
  package.loaded[mod] = nil
  return require(mod)
end

---@diagnostic disable-next-line: param-type-mismatch
my.root = vim.uv.fs_realpath(vim.fn.stdpath('config'))
vim.g.MY_ROOT = my.root

-- merge current my.config (if exists) over default config table
my.config = vim.tbl_deep_extend('force', {
  loglevel = vim.log.levels.DEBUG,

  -- colorscheme name
  -- OR nil to load colorscheme from ~/.vimrc_background
  colorscheme = 'tokyonight-night',

  tree = {
    -- plugin = 'nvimtree', -- default is neotree
    position = 'left',
  },

  formatting = {
    enabled = true,
    ft = {
      lua = { 'stylua' },
      javascript = { 'prettier' },
      json = { 'prettier' },
    },
    ignore_ft = { 'sql' },
  },

  icons = {
    diagnostics = { Error = ' ', Warn = ' ', Hint = '󰌶 ', Info = ' ' },
    dap = {
      Stopped = { '󰁕 ', 'DiagnosticWarn', 'DapStoppedLine' },
      Breakpoint = { ' ' },
      BreakpointCondition = { '' },
      BreakpointRejected = { '', 'DiagnosticError' },
      LogPoint = { '.>' },
    },
  },

  lua = {
    add_plugins_to_workspace = false,
  },

  tagbar = {
    position = 'right',
  },
}, my.config or {})
