local m = {}


function m.subscribe(group, event, callback, opts)
  opts = opts or {}
  opts.group = opts.group or vim.api.nvim_create_augroup(group, { clear = true })
  opts.callback = callback

  return vim.api.nvim_create_autocmd(event, opts)
end

return m
