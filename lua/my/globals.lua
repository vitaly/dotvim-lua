_G.VERBOSE = false

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

  return table.concat(objects, '\n')
end

function _G.PRINT (v)
  print(vim.inspect(v))
  return v
end

function _G.RELOAD(name)
  if VERBOSE then
    puts("reload(" .. name .. ")")
  end
  return require("plenary.reload").reload_module(name)
end

function _G.REQUIRE(name)
  RELOAD(name)

  if VERBOSE then
    puts("require(" .. name .. ")")
  end
  return require(name)
end
