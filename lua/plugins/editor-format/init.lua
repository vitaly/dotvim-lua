local config = require('onion.config')

-- generic autoformatting
config.set_defaults('autoformat', {
  enabled = true,
  log_level = vim.log.levels.INFO,

  filetypes = {
    lua = {
      formatters = { 'stylua' },
    },
    javascript = {
      formatters = { 'prettier' },
    },
    json = {
      formatters = { 'prettier' },
    },
    bash = {
      formatters = { 'shfmt', 'beautysh' },
    },
    sh = {
      formatters = { 'shfmt', 'beautysh' },
    },
    sql = {
      enabled = false,
    },
  },
})

-- conform specific
config.set_defaults('conform', {
  stop_after_first = true,

  default_format_opts = {
    lsp_format = 'fallback',
  },

  formatters = {
    beautysh = {
      args = { '--indent-size', '2', '--force-function-style', 'fnpar', '-' },
    },
  },
})

local toggle_autoformat = function() config.toggle('autoformat.enabled') end

local toggle_autoformat_for_buffer = function(_, opts)
  opts = opts or {}
  local bufnr = opts.bufnr or vim.api.nvim_get_current_buf()

  vim.b[bufnr].disable_autoformat = not vim.b[bufnr].disable_autoformat
end

local ft_enabled_key = function(ft) return 'autoformat.filetypes.' .. ft .. '.enabled' end

local toggle_autoformat_for_filetype = function(_, opts)
  local key = ft_enabled_key(vim.bo[(opts or {}).bufnr or vim.api.nvim_get_current_buf()].filetype)
  config.toggle(key, true)
end

local is_enabled_global = function() return config.get('autoformat.enabled') end

---@param bufnr? number
local is_enabled_for_buffer = function(bufnr)
  bufnr = bufnr or vim.api.nvim_get_current_buf()

  return not vim.b[bufnr].disable_autoformat
end

local is_enabled_for_filetype = function(bufnr) return config.get(ft_enabled_key(vim.bo[bufnr or vim.api.nvim_get_current_buf()].filetype), true) end

local is_enabled = function(bufnr) return is_enabled_global() and is_enabled_for_buffer(bufnr) and is_enabled_for_filetype(bufnr) end

-------------------------------------------------------------------------------
-- glue provider for autoformat status, and listener for toggle
-------------------------------------------------------------------------------
local glue = require('glue').register('plugins/editor-format')
glue.handle('autoformat.status', function(opts)
  local bufnr = opts.bufnr or vim.api.nvim_get_current_buf()
  return {
    enabled = is_enabled(bufnr),
    global = is_enabled_global(),
    buffer = is_enabled_for_buffer(bufnr),
    filetype = is_enabled_for_filetype(bufnr),
  }
end)

glue.handle('autoformat.actions.toggle', toggle_autoformat)
glue.handle('autoformat.actions.toggle.buffer', toggle_autoformat_for_buffer)
glue.handle('autoformat.actions.toggle.filetype', toggle_autoformat_for_filetype)

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
    require('conform').format({ async = true, range = range })
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
  return { timeout_ms = 500 }
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
    ---@type conform.setupOpts
    local opts = config.get('conform') or {}
    opts.log_level = config.get('autoformat.log_level')

    -- formatters_by_ft can come from conform config
    -- or from autoformat config. but the one in autoformat is of a different shape
    -- need to 'masssage' it into the shape conform expects and merge
    opts.formatters_by_ft = {}
    for ft, ft_config in pairs(config.get('autoformat.filetypes') or {}) do
      if ft_config.enabled ~= false and ft_config.formatters then opts.formatters_by_ft[ft] = ft_config.formatters end
    end

    opts.format_on_save = on_save

    require('conform').setup(opts)

    create_commands()
  end,
}
