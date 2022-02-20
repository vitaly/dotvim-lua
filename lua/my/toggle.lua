local function _states(opts)
  return opts.states or { true, false }
end

local function _def(val, default)
  if val == nil then
    return default
  else
    return val
  end
end

local function _default(opts)
  return _def(opts.default, _states(opts)[1])
end

function _G.MAKE_TOGGLE(opts)
  opts = opts or {}

  local next = opts.next

  if type(next) ~= 'function' then
    if not next then
      -- 'next' not given
      next = {}
      local states = _states(opts)
      for i, v in ipairs(states) do
        local j = i % #states + 1
        next[v] = states[j]
      end
    else
      -- a statemap 'next' is given
      if not opts.default then
        error 'statemap requires default'
      end
    end
    -- PRINT(next)

    -- must be a state map
    local state_map = next
    local default = _default(opts)
    next = function(state)
      return _def(state_map[state], default)
    end
  end

  local set = opts.set
  local get = opts.get

  local p = opts.p or print
  if opts.silent then
    p = function(_) end
  end

  if opts.o then
    get = function()
      local val = vim.o[opts.o]
      -- print(opts.o .. ' is "' .. vim.inspect(val) .. '"')
      return val
    end
    set = function(val)
      p(opts.o .. ' = "' .. vim.inspect(val) .. '"')
      vim.o[opts.o] = val
      if opts.set then
        opts.set(val)
      end
    end
  elseif opts.g then
    get = function()
      local val = vim.g[opts.g]
      -- print('g:' .. opts.g .. ' is "' .. vim.inspect(val) .. '"')
      return val
    end
    set = function(val)
      p('g:' .. opts.g .. ' = "' .. vim.inspect(val) .. '"')
      vim.g[opts.g] = val
      if opts.set then
        opts.set(val)
      end
    end
  elseif opts.b then
    get = function()
      local val = vim.b[opts.b]
      -- print('b:' .. opts.b .. ' is "' .. vim.inspect(val) .. '"')
      return val
    end
    set = function(val)
      p('b:' .. opts.b .. ' = "' .. vim.inspect(val) .. '"')
      vim.b[opts.b] = val
      if opts.set then
        opts.set(val)
      end
    end
  end

  if not set then
    error 'set is required'
  end

  if not get then
    local states = _states(opts)
    local state = states[#states]

    -- PRINT { 'default get state', state }

    get = function()
      -- PRINT { 'default get', state }
      return state
    end

    set = function(val)
      state = val
      -- PRINT { 'default set', state }
      opts.set(state)
    end
  end

  return function()
    -- PRINT 'toggle'
    local state = get()
    -- PRINT { 'current', state }
    state = next(state)
    -- PRINT { 'next', state }
    set(state)
  end
end

function _G.REDRAW()
  vim.cmd [[redraw]]
end
