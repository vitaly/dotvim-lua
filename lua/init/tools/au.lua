local M = {}

function M.command(event, opts)
  opts.group = opts.group or error('au.command requires a group', 2)
  opts.callback = opts.callback or error('au.command requires a callback', 2)

  if 'string' == type(opts.group) then
    opts.group = vim.api.nvim_create_augroup(opts.group, { clear = true })
  end

  return vim.api.nvim_create_autocmd(event, opts)
end

function M.callback(group, event, callback, opts)
  opts = opts or {}
  opts.group = group
  opts.callback = callback

  if 'ColorScheme' == event then
    callback()
  end

  return M.command(event, opts)
end

return M
