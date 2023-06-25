local AU = {}

-- if 'clear' is true, will clear the group if it already exists
-- clear is true by default
function AU.group(name, clear)
  if clear == nil then
    clear = true
  end
  return vim.api.nvim_create_augroup(name, { clear = clear })
end

function AU.command(event, opts)
  opts.group = opts.group or error('au.command requires a group', 2)
  opts.callback = opts.callback or error('au.command requires a callback', 2)

  if 'string' == type(opts.group) then
    opts.group = AU.group(opts.group)
  end

  return vim.api.nvim_create_autocmd(event, opts)
end

function AU.callback(group, event, callback, opts)
  opts = opts or {}
  opts.group = group
  opts.callback = callback

  return AU.command(event, opts)
end

function AU.on_colorscheme(group, callback, opts)
  callback()
  return AU.callback(group, 'ColorScheme', callback, opts)
end

function AU.on_lsp_attach(group, callback, opts)
  -- PRINT { 'on_lsp_attach', group, callback, opts }
  return AU.callback(group, 'LspAttach', function(args)
    callback(vim.lsp.get_client_by_id(args.data.client_id), args.buf)
  end, opts)
end

function AU.buffer_callback(buffer, group, event, callback, opts)
  opts = opts or {}
  opts.buffer = buffer or error('missing buffer', 2)

  opts.group = vim.api.nvim_create_augroup(group, { clear = false }) -- can't clear buffer only
  vim.api.nvim_clear_autocmds {
    buffer = opts.buffer,
    group = opts.group,
  }

  opts.callback = callback

  return AU.command(event, opts)
end

return AU
