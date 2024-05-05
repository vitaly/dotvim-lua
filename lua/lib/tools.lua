local debug = my.log.debug
local trace = my.log.trace
-- clone repository into given directory if it doesn't exist
local TOOLS = {}

--- Make sure the repository is cloned in the given directory
--- Note: if directory exists, no other checks are performed
---@param repo string
---@param path string
function TOOLS.git_clone(repo, path, ...)
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

--- stores the groups definitions in g:keymap_groups
--- if g:my_keymap_groups_loaded is set, it will also call which-key.register
---@param keys string
---@param name string
---@param opts? table<string, any>
function TOOLS.keymap_group(keys, name, opts)
  trace { 'declare keymap_group', keys, name, opts }

  opts = opts or { mode = { 'n', 'v' } }
  trace('g:my_keymap_groups', vim.g.my_keymap_groups)

  local groups = vim.g.my_keymap_groups or {}
  table.insert(groups, { keys, name, opts })
  vim.g.my_keymap_groups = groups

  trace('g:my_keymap_groups', vim.g.my_keymap_groups)

  if vim.g.my_keymap_groups_loaded then
    trace { 'register', keys, name, opts }
    require('which-key').register({ [keys] = { name = name } }, opts)
  end
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

---@class KeyDef
---@field [1] string|nil lhs
---@field [2] string|fun() rhs
---@field desc? string
---@field mode? string|string[]
---@field noremap? boolean
---@field remap? boolean
---@field expr? boolean
---@field id string
---@field silent boolean
---@field has? string - server capability required

-- This function combines mapping keys with mapping definition and possible extra attributes
---@param def KeyDef
---@param keys string | table<string, string | boolean | number> | nil
---@return LazyKeys
function TOOLS.map_keys(def, keys)
  if type(keys) ~= 'table' then
    keys = { keys }
  end
  if not def then
    error('missing definition for map_keys ' .. vim.inspect(keys))
  end
  return vim.tbl_extend('keep', keys, def)
end

return TOOLS
