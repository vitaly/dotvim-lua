local toggle_autoformat = function()
  my.config.autoformat.enabled = not my.config.autoformat.enabled
end

-------------------------------------------------------------------------------
-- glue provider for autoformat status, and listener for toggle
-------------------------------------------------------------------------------
local glue = require('glue').register('plugins/editor-format')
glue.answer('autoformat.status', function()
  return {
    enabled = my.config.autoformat.enabled,
  }
end)
glue.listen('autoformat.actions.toggle', toggle_autoformat)

local function create_commands()
  ------------------------------------------------------------------------------
  -- Format
  vim.api.nvim_create_user_command('Format', function(args)
    if not my.config.autoformat.enabled then
      return
    end

    local range = nil
    if args.count ~= -1 then
      local end_line = vim.api.nvim_buf_get_lines(0, args.line2 - 1, args.line2, true)[1]
      range = {
        start = { args.line1, 0 },
        ['end'] = { args.line2, end_line:len() },
      }
    end
    require('conform').format({ async = true, lsp_format = 'fallback', range = range })
  end, { range = true })

  ------------------------------------------------------------------------------
  -- FormatToggle
  vim.api.nvim_create_user_command('FormatToggle', toggle_autoformat, { desc = 'Toggle Autoformat' })

  ------------------------------------------------------------------------------
  -- FormatInfo
  vim.api.nvim_create_user_command('FormatInfo', function()
    vim.cmd('ConformInfo')
  end, { desc = 'Formatting Ifno' })
end

local on_save = function()
  if not my.config.autoformat.enabled then
    return
  end
  return { timeout_ms = 500, lsp_format = 'fallback' }
end

return {
  'stevearc/conform.nvim',

  event = { 'BufWritePre' },
  cmd = { 'FormatInfo', 'Format' },

  init = function()
    vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
    require('which-key').add({ [[<localleader>a]], group = 'Autoformat' })
  end,

  keys = {
    { [[<localleader>af]], '<cmd>Format<cr>', mode = '', desc = 'Format' },
    { [[<localleader>ai]], '<cmd>FormatInfo<cr>', mode = '', desc = 'Formating Info' },

    { [[\a]], [[<cmd>FormatToggle<cr>]], desc = 'Toggle Autoformat' },
  },

  config = function()
    require('conform').setup({
      log_level = vim.log.levels.INFO,
      formatters_by_ft = my.config.autoformat.ft,

      default_format_opts = {
        lsp_format = 'fallback',
      },

      format_on_save = on_save,
    })
    create_commands()
  end,
}
