local format = require('plugins.statusline.format')
local utils = require('plugins.statusline.utils')

local icons = my.config.icons

local toggle_statusline = require('lib.toggle').toggler(
  'g:_show_statusline',
  { true, false },
  function(show)
    require('lualine').hide({ unhide = show })
  end,
  { silent = true }
)

return {
  'nvim-lualine/lualine.nvim', -- https://github.com/nvim-lualine/lualine.nvim
  event = 'VeryLazy',

  keys = {
    { [[\S]], toggle_statusline, desc = 'Toggle Status Line' },
  },

  opts = {
    options = {
      disabled_filetypes = { 'Outline' },
      -- theme = theme.light,
    },

    tabline = { lualine_b = { { 'tabs', mode = 1 } } },
    winbar = { lualine_a = { { 'filename', path = 1 } } },
    inactive_winbar = { lualine_a = { { 'filename', path = 1 } } },

    sections = {
      lualine_a = { 'mode' },
      lualine_b = {
        'branch',
        'diff',
        {
          'diagnostics',
          sources = { 'nvim_diagnostic' },

          symbols = {
            error = icons.diagnostics.Error,
            warn = icons.diagnostics.Warn,
            info = icons.diagnostics.Info,
            hint = icons.diagnostics.Hint,
          },
        },
      },
      lualine_c = {
        format.status,
      },
      lualine_x = { 'encoding', 'fileformat', 'filetype', { utils.lsp_client_name } },
      lualine_y = { '%02B' },
      lualine_z = {
        -- 'progress',
        'location',
      },
    },
    inactive_sections = {
      lualine_z = { 'location' },
    },
    extensions = {
      'aerial',
      'fugitive',
      'lazy',
      'neo-tree',
      'quickfix',
      'symbols-outline',
      'toggleterm',
      'trouble',
    },
  }, -- opts

  config = function(_, opts)
    require('lualine').setup(opts)
  end,
}
