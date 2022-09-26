local DEFAULTS = {
  settings = {},
  disabled = false,
  disabled_filetypes = {},
  debug = false,
}

local M = {}

local function update_config(config)
  M.config = vim.tbl_deep_extend('force', M.config or {}, config)
  _my.config.format = M.config
end

update_config(vim.tbl_deep_extend('force', DEFAULTS, _my.config.format or {}))

local function log(...)
  if M.config.debug then
    PRINT(...)
  end
end

M.disable = function(args)
  if args.args == '' then
    M.config.disabled = true
  else
    M.config.disabled_filetypes[args.args] = true
  end
end

M.enable = function(args)
  if args.bang then
    M.config.disabled_filetypes = {}
    M.config.disabled = false
  elseif args.args == '' then
    M.config.disabled = false
  else
    M.config.disabled_filetypes[args.args] = false
  end
end

M.toggle = function(args)
  if args.args == '' then
    M.config.disabled = not M.config.disabled
  else
    M.config.disabled_filetypes[args.args] = not M.config.disabled_filetypes[args.args]
  end
end

function M.setup(config)
  update_config(config)
  log('format', M.config)

  vim.api.nvim_create_user_command('Format', M.format, { nargs = '*', bar = true, force = true })
  vim.api.nvim_create_user_command('FormatToggle', M.toggle,
    { nargs = '?', bar = true, complete = 'filetype', force = true })
  vim.api.nvim_create_user_command('FormatDisable', M.disable,
    { nargs = '?', bar = true, complete = 'filetype', force = true })
  vim.api.nvim_create_user_command('FormatEnable', M.enable,
    { nargs = '?', bar = true, complete = 'filetype', force = true, bang = true })

  -- _my.au.on_lsp_attach('fmt_attach', M.on_attach)
  -- or M.config.disabled_filetypes[filetype(bufnr)] then
  -- or M.config.disabled
end

local function filetype(bufnr)
  return vim.api.nvim_buf_get_option(bufnr, 'filetype')
end

local function _parse_value(value)
  if not value then
    return true
  end
  local int_value = tonumber(value)
  if int_value then
    return int_value
  end
  if value == 'false' then
    return false
  end
  if value == 'true' then
    return true
  end

  return value
end

function M.format(args)
  local bufnr = vim.api.nvim_get_current_buf()

  local options = {}

  for _, arg in ipairs(args.fargs or {}) do
    local key, value = unpack(vim.split(arg, '='))
    options[key] = _parse_value(value)
  end

  log { 'format', options }


  -- log { 'FORMAT', { async = options.async }, options }
  -- -- TODO: implement cient filtering
  -- vim.lsp.buf.format { async = options.async, formatting_options = options }
  M.format_buffer(bufnr, options)
end

function M.format_buffer(bufnr, options)
  bufnr = bufnr or vim.api.nvim_get_current_buf()
  if vim.b.format_saving then
    log 'format skip'
    return
  end

  -- merge provided options with defaults
  options = vim.tbl_deep_extend('force', M.config.settings.default or {}, M.config.settings[filetype(bufnr)] or {}, options or {})

  for key, val in pairs(options) do
    if type(val) == 'function' then
      options[key] = val()
    end
  end

  log { 'format_buffer', bufnr, options }

  -- local tick = set_tick(bufnr)
  -- log { 'format', 'buf', bufnr, 'tick', tick }
end

return M

-- function M.on_attach(client, bufnr)
--   if not client.supports_method 'textDocument/formatting' then
--     return
--   end

--   local filetype = _filetype(bufnr)
--   local format_options = M.options[filetype] or {}

--   local event = 'BufWritePre'
--   if format_options.async then
--     event = 'BufWritePost'
--   end

--   _subscribe('Format', event, function(args)
--     log { event, 'buf', args.buf }
--     M.format()
--   end, bufnr)
-- end

-- local function set_tick(bufnr)
--   local tick = vim.api.nvim_buf_get_changedtick(bufnr)
--   vim.api.nvim_buf_set_var(bufnr, 'format_changedtick', tick)
--   return tick
-- end

-- -- local defaUlt_handlers = require 'vim.lsp.handlers'

-- -- vim.lsp.handlers['textDocument/formatting'] = function(err, result, ctx, _)
-- --   -- log { 'custom handler', err, result, ctx }
-- --   local client = vim.lsp.get_client_by_id(ctx.client_id)
-- --   local tick = vim.api.nvim_buf_get_var(ctx.bufnr, 'changedtick')
-- --   local format_tick = vim.api.nvim_buf_get_var(ctx.bufnr, 'format_changedtick')
-- --   log { 'custom handler', client.name, err or 'OK', result and 'RES' or '', format_tick, tick }
-- --   if err then
-- --     vim.notify(string.format('[LSP][%s] %s', client.name, err), vim.log.levels.WARN)
-- --   end
-- --   if not result then
-- --     return
-- --   end

-- --   if format_tick == tick then
-- --     vim.lsp.util.apply_text_edits(result, ctx.bufnr, client.offset_encoding)
-- --     log { 'saving', ctx.bufnr }
-- --     vim.api.nvim_buf_set_var(ctx.bufnr, 'format_saving', true)
-- --     vim.cmd [[update]]
-- --     vim.api.nvim_buf_set_var(ctx.bufnr, 'format_saving', false)
-- --     log { 'done saving', ctx.bufnr }
-- --   else
-- --     vim.notify(string.format('[LSP][%s] buffer changed while formatting', client.name), vim.log.levels.INFO)
-- --   end
-- --   tick = set_tick(ctx.bufnr)
-- --   log { 'update', 'tick', tick }
-- -- end
-- local function _subscribe(group, event, callback, bufnr)
--   local augroup = _augroup(group)
--   vim.api.nvim_create_autocmd(event, {
--     group = augroup,
--     desc = 'format on save',
--     buffer = bufnr,
--     callback = callback,
--   })
-- end
