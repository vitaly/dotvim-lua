-- clone repository into given directory if it doesn't exist
local TOOLS = {}

--- Make sure the repository is cloned in the given directory
--- Note: if directory exists, no other checks are performed
---@param repo string
---@param path string
function TOOLS.ensure_cloned(repo, path, ...)
  if vim.uv.fs_stat(path) then
    return
  end

  my.log.info('git clone ' .. repo .. ' into ' .. path)

  vim.fn.system {
    'git',
    'clone',
    '--filter=blob:none',
    ...,
    repo,
    path,
  }
end

--- get highlight attribute from a highlight group
---@param name string
---@param attr string
---@example get_hi_attr('Normal', 'fg')
function TOOLS.get_hi_attr(name, attr)
  local value = vim.fn.synIDattr(vim.fn.hlID(name), attr)
  if '' == value then
    return nil
  end
  return value
end

--- Register the maps with 'which-key'. see lua/plugins/base-keymaps/init.lua - search for which-key
function TOOLS.register_keymap_groups(groups)
  return {
    'folke/which-key.nvim',
    opts = {
      groups = groups,
    },
  }
end

TOOLS.highlight = setmetatable({}, {
  __newindex = function(_, hlgroup, args)
    if 'string' == type(args) then
      vim.cmd(('hi! link %s %s'):format(hlgroup, args))
      return
    end

    local guifg, guibg, gui, guisp = args.guifg or nil, args.guibg or nil, args.gui or nil, args.guisp or nil
    local cmd = { 'hi', hlgroup }
    if guifg then
      table.insert(cmd, 'guifg=' .. guifg)
    end
    if guibg then
      table.insert(cmd, 'guibg=' .. guibg)
    end
    if gui then
      table.insert(cmd, 'gui=' .. gui)
    end
    if guisp then
      table.insert(cmd, 'guisp=' .. guisp)
    end
    vim.cmd(table.concat(cmd, ' '))
  end,
})

return TOOLS
