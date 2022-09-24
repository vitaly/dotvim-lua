local m = {}

function m.subscribe(group, event, callback, opts)
  opts = opts or {}
  opts.group = opts.group or vim.api.nvim_create_augroup(group, { clear = true })
  opts.callback = callback

  return vim.api.nvim_create_autocmd(event, opts)
end

-- usually 'on_attach' callbacks expect (client, bufnr)
-- but LspAttach events sends it as { buf, data: { client_id }}
-- this function wraps the callback and translates the data
function m.on_lsp_attach(group, callback, opts)
  return m.subscribe(group, 'LspAttach', function(args)
    callback(vim.lsp.get_client_by_id(args.data.client_id), args.buf)
  end,
  opts or {})
end

return m
