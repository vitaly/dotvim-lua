-- lua/lib/toggle.lua

local M = {}

local function validate(opts, states, callback)
  assert('table' == type(states), 'states must be a table')
  assert('table' == type(opts), 'opts must be a table')
  if callback then
    assert('function' == type(callback), 'callback must be a function')
  end
end

local log = my.log

local function _debug(opts, ...)
  if opts.debug then
    local args = {}
    for _, v in ipairs { ... } do
      table.insert(args, 'string' == type(v) and v or vim.inspect(v))
    end

    log.debug(table.concat(args, ' '))
  end
end

local function parse_var(var)
  if 'string' == type(var) then
    local scope, key = var:match '([bgo]):(.+)'
    if scope then
      return var, scope, key
    end
  end
  error('invalid toggle variable: ' .. vim.inspect(var))
end

local function get(_, scope, key, var)
  if scope then
    return vim[scope][key]
  else
    return var
  end
end

local function index(state, states)
  for i, v in pairs(states) do
    if v == state then
      return i
    end
  end
end

local function next_state(opts, state, states)
  local i = index(state, states) or 1
  _debug(opts, 'i =', i)
  i = i % #states + 1
  _debug(opts, 'next', i)
  state = states[i]
  return state
end

local function set(opts, scope, key, state)
  if 'g' == scope then
    vim.g[key] = state
  elseif 'b' == scope then
    vim.b[key] = state
  elseif 'o' == scope then
    vim.o[key] = state
  else
    error('unexpected invalid toggle variable scope: ' .. vim.inspect(scope))
  end

  if not opts.silent then
    log.info(string.format('%s is %s', opts.name, vim.inspect(state)))
  end
end

---@param var string variable, e.g. 'g:foo', or 'b:bar'
---@param states table|nil list of states
---@param cb_opts function|table|nil optional callback to call on state changes or opts (see next param)
---@param opts table|nil options
function M.toggle(var, states, cb_opts, opts)
  states = states or { false, true }
  local callback
  if 'function' == type(cb_opts) then
    callback = cb_opts
  else
    opts = cb_opts
  end
  opts = opts or {}
  validate(opts, states, callback)
  local function debug(...)
    _debug(opts, ...)
  end
  debug(var, 'states = ', states, 'opts =', opts, 'cb =', callback)

  local name, scope, key = parse_var(var)
  opts.name = opts.name or name
  debug(name, scope, key)

  local state = get(opts, scope, key, var)
  debug(name, 'current state is', vim.inspect(state))

  state = next_state(opts, state, states)
  debug('next state is', state)

  set(opts, scope, key, state)

  if callback then
    callback(state)
  end

  return state
end

-- TODO: add setter from outside

---@param var string variable, e.g. 'g:foo', or 'b:bar'
---@param states table|nil list of states
---@param cb_opts function|table|nil optional callback to call on state changes or opts (see next param)
---@param opts table|nil options
function M.toggler(var, states, cb_opts, opts)
  return function()
    M.toggle(var, states, cb_opts, opts)
  end
end

function M._test()
  -- TEST  that wrong current state is used
  vim.g.toggle_test = 3
  M.toggle('g:toggle_test', { 1, 2, 3 })
  assert(vim.g.toggle_test == 1)

  vim.g.toggle_test = 1
  M.toggle('g:toggle_test', { 1, 2, 3 })
  assert(vim.g.toggle_test == 2)

  vim.g.toggle_test = 2
  M.toggle('g:toggle_test', { 1, 2, 3 })
  assert(vim.g.toggle_test == 3)

  -- TEST  that missing state var is treated like first state
  vim.g.toggle_test = nil
  M.toggle('g:toggle_test', { 1, 2, 3 })
  assert(vim.g.toggle_test == 2)

  -- TEST that default states is { false, true}
  vim.g.toggle_test = nil
  M.toggle 'g:toggle_test'
  assert(vim.g.toggle_test == true)
  vim.g.toggle_test = 7
  M.toggle 'g:toggle_test'
  assert(vim.g.toggle_test == true)
  vim.g.toggle_test = false
  M.toggle 'g:toggle_test'
  assert(vim.g.toggle_test == true)
  vim.g.toggle_test = true
  M.toggle 'g:toggle_test'
  assert(vim.g.toggle_test == false)

  -- test that states can have mixed types
  vim.b.toggle_test = 1
  assert('bar' == M.toggle('b:toggle_test', { 'foo', 1, 'bar' }))

  -- test that state is passed to callback
  local ret
  vim.g.toggle_test = 3
  M.toggle('g:toggle_test', { 1, 2, 3 }, function(res)
    ret = res
  end)
  assert(1 == ret)

  log.info 'ok'
end

function M.test()
  REQUIRE('lib.toggle')._test()
end

return M
