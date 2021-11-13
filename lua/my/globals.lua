function _G.PRINT (v)
  print(vim.inspect(v))
  return v
end

function _G.RELOAD(...)
  return require("plenary.reload").reload_module(...)
end

function _G.REQUIRE(name)
  RELOAD(name)
  return require(name)
end

function _G.puts(...)
  local objects = {}
  for i = 1, select('#', ...) do
    local v = select(i, ...)
    table.insert(objects, v)
  end

  print(table.concat(objects, '\n'))
  return ...
end

function _G.inspect(...)
  local objects = {}
  for i = 1, select('#', ...) do
    local v = select(i, ...)
    table.insert(objects, vim.inspect(v))
  end

  print(table.concat(objects, '\n'))
  return ...
end
