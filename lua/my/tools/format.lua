local M = {
  config = {},
  enabled = false,
  disabled_filetypes = {},
}

local debug = false

if debug then
  function M.PRINT(...)
    PRINT(...)
  end
else
  function M.PRINT(...) end
end

function M.setup(format_options)
  M.config = vim.tbl_deep_extend('force', M.config, format_options or {})

  vim.api.nvim_create_user_command('Format', M.format, { nargs = '*', bar = true, force = true })
  vim.api.nvim_create_user_command('FormatToggle', M.toggle,
    { nargs = '?', bar = true, complete = 'filetype', force = true })
  vim.api.nvim_create_user_command('FormatDisable', M.disable,
    { nargs = '?', bar = true, complete = 'filetype', force = true })
  vim.api.nvim_create_user_command('FormatEnable', M.enable,
    { nargs = '?', bar = true, complete = 'filetype', force = true, bang = true })

  nmap(',f', M.format, 'Format')

  require('my.tools').on_lsp_attach('fmt_attach', M.on_attach)
end

M.disable = function(options)
  if options.args == '' then
    M.disabled = true
  else
    M.disabled_filetypes[options.args] = true
  end
end

M.enable = function(options)
  if options.bang then
    M.disabled_filetypes = {}
    M.disabled = false
  elseif options.args == '' then
    M.disabled = false
  else
    M.disabled_filetypes[options.args] = false
  end
end

M.toggle = function(options)
  if options.args == '' then
    M.disabled = not M.disabled
  else
    M.disabled_filetypes[options.args] = not M.disabled_filetypes[options.args]
  end
end

local function _augroup(group)
  return vim.api.nvim_create_augroup(group, { clear = false })
end

local function _buf()
  return vim.api.nvim_get_current_buf()
end

local function _filetype(bufnr)
  return vim.api.nvim_buf_get_option(bufnr or _buf(), 'filetype')
end

local function _subscribe(group, event, callback, bufnr)
  local augroup = _augroup(group)
  vim.api.nvim_clear_autocmds {
    buffer = bufnr or _buf(),
    group = augroup,
  }
  vim.api.nvim_create_autocmd(event, {
    group = augroup,
    desc = 'format on save',
    buffer = bufnr,
    callback = callback,
  })
end

function M.on_attach(client, bufnr)
  if not client.supports_method 'textDocument/formatting' then
    return
  end

  local filetype = _filetype(bufnr)
  local format_options = M.config[filetype] or {}

  local event = 'BufWritePost'
  if format_options.sync then
    event = 'BufWritePre'
  end

  _subscribe('Format', event, function(args)
    M.PRINT { event, 'buf', args.buf }
    M.format()
  end, bufnr)
end

local function set_tick(bufnr)
  local tick = vim.api.nvim_buf_get_changedtick(bufnr)
  vim.api.nvim_buf_set_var(bufnr, 'format_changedtick', tick)
  return tick
end

function M.format()
  local bufnr = _buf()
  local tick = set_tick(bufnr)
  PRINT { 'format', 'buf', bufnr, 'tick', tick }
  if vim.b.format_saving or M.disabled or M.disabled_filetypes[_filetype(bufnr)] then
    M.PRINT 'format skip'
    return
  end

  -- TBD: finish this
  -- - separate format command and format function
  -- command can parse the args, but
  -- function should get all already parsed
  -- then merge with defaults
  -- for key, option in pairs(format_options) do
  --   if type(option) == 'function' then
  --     format_options[key] = option()
  --   end
  -- end
  -- for _, option in ipairs(options.fargs or {}) do
  --   local key, value = unpack(vim.split(option, '='))
  --   format_options[key] = M._parse_value(key, value)
  -- end

  local options = vim.deepcopy(M.config[_filetype(_buf())] or {})

  M.PRINT { 'FORMAT', { async = not options.sync }, options }
  -- TODO: implement cient filtering
  vim.lsp.buf.format { async = not options.sync, formatting_options = options }
end

-- local defaUlt_handlers = require 'vim.lsp.handlers'

vim.lsp.handlers['textDocument/formatting'] = function(err, result, ctx, _)
  -- M.PRINT { 'custom handler', err, result, ctx }
  local client = vim.lsp.get_client_by_id(ctx.client_id)
  local tick = vim.api.nvim_buf_get_var(ctx.bufnr, 'changedtick')
  local format_tick = vim.api.nvim_buf_get_var(ctx.bufnr, 'format_changedtick')
  M.PRINT { 'custom handler', client.name, err or 'OK', result and 'RES' or '', format_tick, tick }
  if err then
    vim.notify(string.format('[LSP][%s] %s', client.name, err), vim.log.levels.WARN)
  end
  if not result then
    return
  end

  if format_tick == tick then
    vim.lsp.util.apply_text_edits(result, ctx.bufnr, client.offset_encoding)
    M.PRINT { 'saving', ctx.bufnr }
    vim.api.nvim_buf_set_var(ctx.bufnr, 'format_saving', true)
    vim.cmd [[update]]
    vim.api.nvim_buf_set_var(ctx.bufnr, 'format_saving', false)
    M.PRINT { 'done saving', ctx.bufnr }
  else
    vim.notify(string.format('[LSP][%s] buffer changed while formatting', client.name), vim.log.levels.INFO)
  end
  tick = set_tick(ctx.bufnr)
  M.PRINT { 'update', 'tick', tick }
end

return M
