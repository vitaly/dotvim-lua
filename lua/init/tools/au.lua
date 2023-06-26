local AU = {}

-- if 'clear' is true, will clear the group if it already exists
-- clear is true by default
function AU.group(name, clear)
  if clear == nil then
    clear = true
  end
  return vim.api.nvim_create_augroup(name, { clear = clear })
end

-- Setup autocommand
-- If the group is a string, then it will be created (and it's commands cleared)
---@param group string|any
---@param event string
---@param callback fun(any)
---@param opts? table
function AU.command(group, event, callback, opts)
  group = group or error('au.command requires a group', 2)
  callback = callback or error('au.command requires a callback', 2)

  opts = opts or {}
  opts.group = 'string' == type(group) and AU.group(group) or group
  opts.callback = callback

  return vim.api.nvim_create_autocmd(event, opts)
end

function AU.on_colorscheme(group, callback, opts)
  callback()
  return AU.command(group, 'ColorScheme', callback, opts)
end

function AU.on_lsp_attach(group, callback, opts)
  -- PRINT { 'on_lsp_attach', group, callback, opts }
  return AU.command(group, 'LspAttach', function(args)
    callback(vim.lsp.get_client_by_id(args.data.client_id), args.buf)
  end, opts)
end

function AU.buffer_command(buffer, group, event, callback, opts)
  opts = opts or {}
  opts.buffer = buffer or error('missing buffer', 2)

  group = vim.api.nvim_create_augroup(group, { clear = false }) -- can't clear buffer only
  vim.api.nvim_clear_autocmds { buffer = opts.buffer, group = group }

  return AU.command(group, event, callback, opts)
end

return AU
