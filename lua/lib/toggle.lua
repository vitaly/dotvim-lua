-- lua/lib/toggle.lua

local M = {}

local inspect = vim.inspect

local function validate(opts, states, callback)
  assert('table' == type(states), 'states must be a table')
  assert('table' == type(opts), 'opts must be a table')
  if callback then
    assert('function' == type(callback), 'callback must be a function')
  end
end

local function _debug(opts, ...)
  if opts.debug then
    local args = {}
    for _, v in ipairs { ... } do
      table.insert(args, 'string' == type(v) and v or vim.inspect(v))
    end

    print(table.concat(args, ' '))
  end
end

local function parse_var(var)
  if 'string' == type(var) then
    local scope, key = var:match '([bgo]):(.+)'
    if scope then
      return var, scope, key
    end
  end
  return 'state'
end

local function get(_, scope, key, var)
  return scope and vim[scope][key] or var
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
  _debug(opts, 'i', i)
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
    _debug(opts, 'internal state')
  end

  if not opts.silent then
    print(string.format('%s is %s', opts.name, vim.inspect(state)))
  end
end

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
  opts.debug = false
  local function debug(...)
    _debug(opts, ...)
  end
  debug(var, 'opts=', opts, 'cb=', callback)

  local name, scope, key = parse_var(var)
  opts.name = opts.name or name
  debug(name, scope, key)

  local state = get(opts, scope, key, var)
  debug(name, 'current state is', inspect(state))

  state = next_state(opts, state, states)
  debug('next state is', state)

  set(opts, scope, key, state)

  if callback then
    callback(state)
  end

  return state
end

function M.toggler(...)
  local args = { ... }
  return function()
    M.toggle(unpack(args))
  end
end

function M._test()
  vim.g.toggle_test = 7
  M.toggle 'g:toggle_test'

  assert(true == vim.g.toggle_test)
  M.toggle 'g:toggle_test'
  assert(false == vim.g.toggle_test)

  vim.b.toggle_test = 1
  assert('bar' == M.toggle('b:toggle_test', { 'foo', 1, 'bar' }))

  assert(2 == M.toggle(nil, { 1, 2, 3 }))
  local ret
  M.toggle(3, { 1, 2, 3 }, function(res)
    ret = res
  end, { debug = false })
  assert(1 == ret)

  M.toggle(1, nil, { debug = false })

  print 'ok'
end

function M.test()
  REQUIRE('lib.toggle')._test()
end

return M