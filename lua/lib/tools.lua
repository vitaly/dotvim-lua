-- local debug = my.log.debug
-- local trace = my.log.trace
-- clone repository into given directory if it doesn't exist
local TOOLS = {}

--- Make sure the repository is cloned in the given directory
--- Note: if directory exists, no other checks are performed
---@param repo string
---@param path string
---@return boolean success
function TOOLS.git_clone(repo, path, ...)
  if vim.uv.fs_stat(path) then return true end

  local cmd = { 'git', 'clone', '--filter=blob:none' }
  vim.list_extend(cmd, { ... })
  vim.list_extend(cmd, { repo, path })

  vim.notify(vim.inspect(cmd), vim.log.levels.INFO)

  local output = vim.fn.system(cmd)

  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { 'Failed to clone ' .. repo .. ':\n', 'ErrorMsg' },
      { output, 'WarningMsg' },
      { '\nPress any key to exit...' },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end

  return true
end

--- get highlight attribute from a highlight group
---@param name string
---@param attr string
---@example get_hi_attr('Normal', 'fg')
function TOOLS.get_hi_attr(name, attr)
  local value = vim.fn.synIDattr(vim.fn.hlID(name), attr)
  if '' == value then return nil end
  return value
end

--- Set or link a highlight group
---@param name string
---@param spec table|string  -- table of guifg/guibg/gui/guisp or string target for link
function TOOLS.highlight(name, spec)
  if type(spec) == 'string' then
    vim.cmd(('hi! link %s %s'):format(name, spec))
    return
  end
  local cmd = { 'hi', name }
  if spec.guifg then table.insert(cmd, 'guifg=' .. spec.guifg) end
  if spec.guibg then table.insert(cmd, 'guibg=' .. spec.guibg) end
  if spec.gui then table.insert(cmd, 'gui=' .. spec.gui) end
  if spec.guisp then table.insert(cmd, 'guisp=' .. spec.guisp) end
  vim.cmd(table.concat(cmd, ' '))
end

TOOLS.modpath = function(module) return vim.fs.joinpath(vim.fn.stdpath('config'), 'lua', unpack(vim.split(module, '.', { plain = true }))) end

TOOLS.vplug = function(spec)
  spec.dir = spec.dir or TOOLS.modpath(spec[1])
  return spec
end

return TOOLS
