local AU = {}

-- Create an autocommand group
-- If the group exists, it's commands will be cleared
---@param name string
function AU.group(name)
  return vim.api.nvim_create_augroup(name, { clear = true })
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

-- Setup callback for LspAttach event
---@param group string
---@param on_attach fun(client, buffer, args)
---@param opts? table
function AU.lsp_on_attach(group, on_attach, opts)
  AU.command(group, 'LspAttach', function(args)
    local buffer = args.buf
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    on_attach(client, buffer, args)
  end, opts)
end

-- Setup callback for colorscheme change event.
-- Can be used to adjust colors setup by the colorscheme.
---@param group string
---@param callback fun()
---@param opts? table
function AU.on_colorscheme_changed(group, callback, opts)
  callback() -- need to call it once to set the current colorscheme
  return AU.command(group, 'ColorScheme', callback, opts)
end

return AU
