-- if 'clear' is true, will clear the group if it already exists
-- clear is true by default

local AU = {}

function AU.buffer_callback(buffer, group, event, callback, opts)
  opts = opts or {}
  opts.buffer = buffer or error('missing buffer', 2)

  opts.group = vim.api.nvim_create_augroup(group, { clear = false }) -- can't clear buffer only
  vim.api.nvim_clear_autocmds {
    buffer = opts.buffer,
    group = opts.group,
  }

  opts.callback = callback

  return AU._command(event, opts)
end

return AU
