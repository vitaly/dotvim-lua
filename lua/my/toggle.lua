-- lua/my/toggle.lua

local function _def(val, default)
  if val == nil then
    return default
  else
    return val
  end
end

-----------------------------------------------------------------------
-----------------------------------------------------------------------
-- Switch is an object that can cycle through states ------------------
-----------------------------------------------------------------------
-- Attributes: --------------------------------------------------------
-- name: string, name of the switch ------------------------------------
--  states: table of states -------------------------------------------
--  state: string, current state ---------------------------------------
--  silent: boolean, if true, don't echo the state --------------------
--  o: option to set to the current state -----------------------------
--  g: global variable to set to the current state --------------------
--  b: buffer variable to set to the current state --------------------
-----------------------------------------------------------------------
local Switch = {
  states = { false, true },
  silent = true,

  p = function(_, msg)
    print(msg)
  end,
}

function Switch:dump()
  PRINT(self)
end

function Switch:first_state()
  return self.states[1]
end

function Switch:transitions()
  local t = {}
  local states = self.states
  for i, v in ipairs(states) do
    local j = i % #states + 1
    t[v] = states[j]
  end
  return t
end

function Switch:var()
  if self.o then
    return 'o:' .. self.o
  elseif self.g then
    return 'g:' .. self.g
  elseif self.b then
    return 'b:' .. self.b
  else
    return 'self:state'
  end
end

function Switch:get()
  local val
  if self.o then
    val = vim.o[self.o]
  elseif self.g then
    val = vim.g[self.g]
  elseif self.b then
    val = vim.b[self.b]
  else
    val = self.state
  end

  self.p(self:var() .. ' is "' .. vim.inspect(val) .. '"')
  return val
end

function Switch:notify(val)
  if self.name then
    print(self.name .. ' is ' .. vim.inspect(val))
  end
end

function Switch:changed(val)
  self.p(self:var() .. ' changed to' .. vim.inspect(val))
end

function Switch:set(val)
  if self.o then
    vim.o[self.o] = val
  elseif self.g then
    vim.g[self.g] = val
  elseif self.b then
    vim.b[self.b] = val
  end

  self.state = val

  self:notify(val)
  self:changed(val)

  if not self.silent then
    print(self:var() .. ' = "' .. vim.inspect(val) .. '"')
  end
end

function Switch:current_state()
  return _def(self:get(), self.default)
end

function Switch:next_state(state) ----------------- default next ----------------------------
  return _def(self.next[state], self.default)
end

function Switch:toggle() ---------------------------------------------------- toggle ----
  self:p('toggle ' .. self:var())
  local state
  -- self:p('toggle')
  state = self:current_state()
  -- PRINT { 'current', state }
  state = self:next_state(state)
  -- PRINT { 'next', state }
  return self:set(state)
end

-- if the 'get' value is null, run the toggle to initialize the value ot the default
function Switch:clean_state()
  local val = self:get()
  local state = _def(val, self.default)
  if val ~= state then
    -- print 'setting default'
    self:set(state)
  end
end

function Switch:_default_name()
  return self.o or self.g or self.b or 'switch'
end

function Switch:init()
  self.name = self.name or self:_default_name()

  self.default = _def(self.default, self:first_state())
  self.next = self.next or self:transitions()
  if self.verbose then
    self.silent = false
  end
  if self.silent then
    self.p = function(_) end
  end
  if self.clean then
    self:clean_state()
  end

  local swtich = self
  self.toggler = function()
    swtich:toggle()
  end
end

---------------------------------
function Switch:new(o)
  o = o or {}
  setmetatable(o, self)
  self.__index = self
  o:init()
  return o
end

---------------------------------
---------------------------------
---------------------------------
---------------------------------
return {
  create = function(opts)
    return Switch:new(opts)
  end,
}
