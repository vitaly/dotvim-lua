local format = require('plugins.statusline.format')
local utils = require('plugins.statusline.utils')

local toggle_statusline = require('lib.toggle').toggler(
  'g:_show_statusline',
  { true, false },
  function(show) require('lualine').hide({ unhide = show }) end,
  { silent = true }
)

-- Default icons in case onion.config doesn't provide them
local default_icons = {
  diagnostics = {
    Error = 'E',
    Warn = 'W',
    Hint = '󰌶 ',
    Info = 'I',
  },
}

return {
  'nvim-lualine/lualine.nvim', -- https://github.com/nvim-lualine/lualine.nvim
  event = 'VeryLazy',

  dependencies = {
    'vitaly/onion.nvim',
  },

  keys = {
    { [[\S]], toggle_statusline, desc = 'Toggle Status Line' },
  },

  config = function()
    local config = require('onion.config')
    local icons = vim.tbl_deep_extend('force', default_icons, config.get('icons') or {})

    require('lualine').setup({
      options = {
        disabled_filetypes = {
          'dap-repl',
          'dapui_breakpoints',
          'dapui_console',
          'dapui_scopes',
          'dapui_stacks',
          'dapui_watches',

          'Outline',

          'snacks_picker_list',

          'toggleterm',
        },
        always_show_tabline = false,
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
    })
  end,
}
