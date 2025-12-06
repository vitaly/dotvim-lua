local config = require('onion.config')
config.set_defaults('autoformat', {
  enabled = true,
  log_level = vim.log.levels.INFO,
  ft = {
    lua = { 'stylua' },
    javascript = { 'prettier' },
    json = { 'prettier' },
  },
  ignore_ft = { 'sql' },
})

local toggle_autoformat = function() config.set('autoformat.enabled', not config.get('autoformat.enabled')) end

local toggle_autoformat_for_buffer = function(_, opts)
  opts = opts or {}
  local bufnr = opts.bufnr or vim.api.nvim_get_current_buf()

  vim.b[bufnr].disable_autoformat = not vim.b[bufnr].disable_autoformat
end

local toggle_autoformat_for_filetype = function(_, opts)
  opts = opts or {}
  local bufnr = opts.bufnr or vim.api.nvim_get_current_buf()
  local ft = vim.bo[bufnr].filetype

  local ignore_ft = config.get('autoformat.ignore_ft')
  if vim.tbl_contains(ignore_ft, ft) then
    -- remove from ignore list
    ignore_ft = vim.tbl_filter(function(v) return v ~= ft end, ignore_ft)
  else
    table.insert(ignore_ft, ft)
  end
  config.set('autoformat.ignore_ft', ignore_ft)
end

local is_enabled_global = function() return config.get('autoformat.enabled') end

---@param bufnr? number
local is_enabled_for_buffer = function(bufnr)
  bufnr = bufnr or vim.api.nvim_get_current_buf()

  return not vim.b[bufnr].disable_autoformat
end

local is_enabled_for_filetype = function(bufnr)
  bufnr = bufnr or vim.api.nvim_get_current_buf()

  local ft = vim.bo[bufnr].filetype

  return not vim.tbl_contains(config.get('autoformat.ignore_ft'), ft)
end

local is_enabled = function(bufnr) return is_enabled_global() and is_enabled_for_buffer(bufnr) and is_enabled_for_filetype(bufnr) end

-------------------------------------------------------------------------------
-- glue provider for autoformat status, and listener for toggle
-------------------------------------------------------------------------------
local glue = require('glue').register('plugins/editor-format')
glue.answer('autoformat.status', function(opts)
  local bufnr = opts.bufnr or vim.api.nvim_get_current_buf()
  return {
    enabled = is_enabled(bufnr),
    global = is_enabled_global(),
    buffer = is_enabled_for_buffer(bufnr),
    filetype = is_enabled_for_filetype(bufnr),
  }
end)

glue.listen('autoformat.actions.toggle', toggle_autoformat)
glue.listen('autoformat.actions.toggle.buffer', toggle_autoformat_for_buffer)
glue.listen('autoformat.actions.toggle.filetype', toggle_autoformat_for_filetype)

local function create_commands()
  ------------------------------------------------------------------------------
  -- Format
  vim.api.nvim_create_user_command('Format', function(args)
    if not config.get('autoformat.enabled') then return end

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
  vim.api.nvim_create_user_command('FormatToggleBuffer', toggle_autoformat_for_buffer, { desc = 'Toggle Buffer Autoformat' })
  vim.api.nvim_create_user_command('FormatToggleFiletype', toggle_autoformat_for_filetype, { desc = 'Toggle Filetype Autoformat' })

  ------------------------------------------------------------------------------
  -- FormatInfo
  vim.api.nvim_create_user_command('FormatInfo', function() vim.cmd('ConformInfo') end, { desc = 'Formatting Ifno' })
end

local on_save = function(bufnr)
  if not is_enabled(bufnr) then return end
  return { timeout_ms = 500, lsp_format = 'fallback' }
end

return {
  'stevearc/conform.nvim', -- https://github.com/stevearc/conform.nvim

  event = { 'BufWritePre' },
  cmd = { 'FormatInfo', 'Format' },

  init = function()
    vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
    require('which-key').add({
      { [[<localleader>a]], group = 'Autoformat' },
      { [[\a]], group = 'Autoformat' },
    })
  end,

  keys = {
    { [[<localleader>af]], '<cmd>Format<cr>', mode = '', desc = 'Format' },
    { [[<localleader>ai]], '<cmd>FormatInfo<cr>', mode = '', desc = 'Formating Info' },

    { [[\aa]], [[<cmd>FormatToggle<cr>]], desc = 'Toggle Autoformat' },
    { [[\ab]], [[<cmd>FormatToggleBuffer<cr>]], desc = 'Toggle Buffer Autoformat' },
    { [[\af]], [[<cmd>FormatToggleFiletype<cr>]], desc = 'Toggle Filetype Autoformat' },
  },

  config = function()
    require('conform').setup({
      log_level = config.get('autoformat.log_level'),

      formatters_by_ft = config.get('autoformat.ft'),

      default_format_opts = {
        lsp_format = 'fallback',
      },

      format_on_save = on_save,
    })
    create_commands()
  end,
}
