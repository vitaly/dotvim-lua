local DEFAULTS = {
  settings = {},
  disabled = false,
  disabled_filetypes = {},
  debug = false,
}

local M = {}

-------------------------------------------------------------------------------
-- CONFIG
-- keep M.config and my.config.format in sync
local function update_config(config)
  M.config = vim.tbl_deep_extend('force', M.config or {}, config)
  my.config.format = M.config
end
update_config(vim.tbl_deep_extend('force', DEFAULTS, my.config.format or {}))

local function log(...)
  if M.config.debug then
    PRINT(...)
  end
end

-------------------------------------------------------------------------------
-- HELPERS
-------------------------------------------------------------------------------

-- return buffer's filetype
local function filetype(bufnr)
  return vim.api.nvim_get_option_value('filetype', { buf = bufnr })
end

-- parse value from command line
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

-------------------------------------------------------------------------------
-- SETUP
-------------------------------------------------------------------------------
-- * update config (merge provided into existing)
-- * define user commands
-- * TBD: subscribe to LSP on-attach to setup autoformating
function M.setup(config)
  update_config(config)
  log('format', M.config)

  vim.api.nvim_create_user_command('Format', M.format, { nargs = '*', bar = true, force = true })
  vim.api.nvim_create_user_command('FormatToggle', M.toggle, { nargs = '?', bar = true, complete = 'filetype', force = true })
  vim.api.nvim_create_user_command('FormatDisable', M.disable, { nargs = '?', bar = true, complete = 'filetype', force = true })
  vim.api.nvim_create_user_command('FormatEnable', M.enable, { nargs = '?', bar = true, complete = 'filetype', force = true, bang = true })

  my.au.on_lsp_attach('format_attach', M.on_attach)
end

-------------------------------------------------------------------------------
-- USER COMMANDS
-------------------------------------------------------------------------------

-------------------------------------------------------------------------------
-- DISABLE
M.disable = function(args)
  if args.args == '' then
    M.config.disabled = true
  else
    M.config.disabled_filetypes[args.args] = true
  end
end

-------------------------------------------------------------------------------
-- ENABLE
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

-------------------------------------------------------------------------------
-- TOGGLE
M.toggle = function(args)
  if args.args == '' then
    M.config.disabled = not M.config.disabled
  else
    M.config.disabled_filetypes[args.args] = not M.config.disabled_filetypes[args.args]
  end
end

-------------------------------------------------------------------------------
-- FORMAT
-- parse command arguments. support foo=bar syntax
-- merge options with defaults and filetype-specific settings
-- call formatter
function M.format(args)
  local bufnr = vim.api.nvim_get_current_buf()

  local options = {}

  for _, arg in ipairs(args.fargs or {}) do
    local key, value = unpack(vim.split(arg, '='))
    options[key] = _parse_value(value)
  end

  log { 'format', options }

  M.format_buffer(bufnr, options)
end

function _get_clients(bufnr, filter)
  return vim.tbl_filter(function(client)
    return client.supports_method 'textDocument/formatting' and (not filter or filter(client))
  end, vim.lsp.buf_get_clients(bufnr))
end

-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
-- FORMATTER
function M.format_buffer(bufnr, options)
  bufnr = bufnr or vim.api.nvim_get_current_buf()

  -- guard agains endless loop
  if vim.b.format_in_progress then
    log 'format skip'
    return
  end

  -- merge provided options with defaults
  options = vim.tbl_deep_extend('force', M.config.settings.default or {}, M.config.settings[filetype(bufnr)] or {}, options or {})

  -- resolve dynamic options
  for key, val in pairs(options) do
    -- TODO: may be it should go under options.formatting
    -- no need to control e.g. 'async' from command line
    if type(val) == 'function' then
      options[key] = val()
    end
  end

  log { 'format_buffer', bufnr, options }

  if options.cycle then
    log('cycle: ' .. options.cycle[1])
    options.only = { options.cycle[1] }
  end

  local filter
  if options.only then
    filter = function(client)
      return vim.tbl_contains(options.only, client.name)
    end
  elseif options.exclude then
    filter = function(client)
      return not vim.tbl_contains(options.exclude, client.name)
    end
  end

  local args = {
    async = options.async,
    bufnr = bufnr,
    filter = filter,
    formatting_options = options.formatting or {},
  }

  log(args)

  if M.config.debug then
    local clients = _get_clients(bufnr, filter)
    for _, client in ipairs(clients) do
      log('client: ' .. client.name)
    end
  end

  if args.async then
    error 'async not supported'
  else
    vim.api.nvim_buf_set_var(bufnr, 'formating', true)
    vim.lsp.buf.format(args)
    vim.api.nvim_buf_set_var(bufnr, 'formating', false)
  end

  -- -- TODO: implement cient filtering
  -- local tick = set_tick(bufnr)
end

function M.on_attach(client, bufnr)
  if not client.supports_method 'textDocument/formatting' then
    return
  end

  log(string.format('formatting on_attach: %s on buffer %d', client.name, bufnr))

  local options = vim.tbl_deep_extend('force', M.config.settings.default or {}, M.config.settings[filetype(bufnr)] or {})

  local event = 'BufWritePre'
  if options.async then
    event = 'BufWritePost'
  end

  my.au.buffer_command(bufnr, 'autoformat', event, function()
    if M.config.disabled or M.config.disabled_filetypes[filetype(bufnr)] then
      log 'autoformat disabled'
      return
    end

    log { 'autoformat', bufnr, filetype(bufnr) }
    -- pass 'async' to make sure that request will match the event we subscribe to
    M.format_buffer(bufnr, { async = options.async })
  end, { desc = 'autoformat' })
end
return M

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
-- --     vim.api.nvim_buf_set_var(ctx.bufnr, 'format_in_progress', true)
-- --     vim.cmd [[update]]
-- --     vim.api.nvim_buf_set_var(ctx.bufnr, 'format_in_progress', false)
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
