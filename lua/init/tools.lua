--------------------------------------------------------------------------------
_G.VERBOSE = false

--------------------------------------------------------------------------------
function _G.PUTS(...)
  local objects = {}
  for i = 1, select('#', ...) do
    local v = select(i, ...)
    table.insert(objects, v)
  end

  print(table.concat(objects, '\n'))
  return ...
end

--------------------------------------------------------------------------------
local function inspect(...)
  local objects = {}
  for i = 1, select('#', ...) do
    local v = select(i, ...)
    table.insert(objects, vim.inspect(v))
  end

  return table.concat(objects, '\n')
end

--------------------------------------------------------------------------------
function _G.PRINT(...)
  print(inspect(...))
  return ...
end

--------------------------------------------------------------------------------
-- do not call this before `plenary` is loaded
function _G.RELOAD(name)
  if VERBOSE then
    puts('reload(' .. name .. ')')
  end
  return require('plenary.reload').reload_module(name)
end

--------------------------------------------------------------------------------
function _G.REQUIRE(name)
  RELOAD(name)

  if VERBOSE then
    puts('require(' .. name .. ')')
  end
  return require(name)
end
