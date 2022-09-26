-- init.tools.reload.lua

-- do not call this before `plenary` is loaded
function _my.reload(name)
  if VERBOSE then
    print('reload(' .. name .. ')')
  end
  return require('plenary.reload').reload_module(name)
end

function _my.require(name)
  RELOAD(name)

  if VERBOSE then
    print('require(' .. name .. ')')
  end
  return require(name)
end
