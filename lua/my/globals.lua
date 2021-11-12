PRINT = function(v)
  print(vim.inspect(v))
  return v
end

RELOAD = function(...)
  return require("plenary.reload").reload_module(...)
end

REQUIRE = function(name)
  RELOAD(name)
  return require(name)
end
