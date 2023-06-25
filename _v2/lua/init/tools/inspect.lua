--------------------------------------------------------------------------------
function _my.puts(...)
  local objects = {}
  for i = 1, select('#', ...) do
    local v = select(i, ...)
    table.insert(objects, v)
  end

  print(table.concat(objects, '\n'))
  return ...
end

--------------------------------------------------------------------------------
function _my.inspect(...)
  local objects = {}
  for i = 1, select('#', ...) do
    local v = select(i, ...)
    table.insert(objects, vim.inspect(v))
  end

  return table.concat(objects, '\n')
end

--------------------------------------------------------------------------------
function _my.print(...)
  print(_my.inspect(...))
  return ...
end

--------------------------------------------------------------------------------
function _my.keys(t, pat)
  for k, _ in pairs(t) do
    if not pat or k:match(pat) then
      print(k)
    end
  end
end
