-- lua/init/tools.lua

--------------------------------------------------------------------------------

_G._my = _G._my or {}
_my.config = _my.config or {}

require 'init.tools.inspect'
_G.PRINT = _my.print

require 'init.tools.reload'
_G.REQUIRE = _my.require
_G.RELOAD = _my.reload

_my.au = require 'init.tools.au'
_my.ui = require 'init.tools.ui'

--------------------------------------------------------------------------------
-- LAYERS
-- layer config is in _my.config[layer_name] where name is withouth the 'layers.' prefix
function _my.layer(module)
  local layer = module:match 'layers%.(.+)'
  if layer then
    layer = layer:match(".*%.(.*)") or layer
  end
  return layer or error(string.format('invalid layer module: %s', module))
end

-- by convention, for layers that support multiple 'engines', the
-- current engine is stored in config[1]
-- this function retrieves it, given module name (from top of the module you can pass `...`)
-- and if you pass `variants`, the engine will be validated against it
function _my.engine(module, variants)
  local layer = _my.layer(module)
  local engine = _my.config[layer][1]
  if variants and not vim.tbl_contains(variants, engine) then
    error(string.format("invalid engine '%s' for layer '%s'. valid engines: '%s'", engine, layer,
      table.concat(variants, "', '")))
  end
  return require(module .. '.' .. engine)
end
