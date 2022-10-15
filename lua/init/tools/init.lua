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
    layer = layer:match '.*%.(.*)' or layer
  end
  return layer or error(string.format('invalid layer module: %s', module))
end

-- by convention, for layers that support multiple 'engines', the
-- current engine is stored in config[1]
-- this function retrieves it, given module name (from top of the module you can pass `...`)
-- and if you pass `variants`, the engine will be validated against it
function _my.engine(module, variants)
  local layer = _my.layer(module)
  local config = _my.config[layer] or {}

  local engine = config[1] or variants[1]
  if not engine then
    error 'need to either provide engine config or variants'
  end
  if variants and not vim.tbl_contains(variants, engine) then
    error(string.format("invalid engine '%s' for layer '%s'. valid engines: '%s'", engine, layer, table.concat(variants, "', '")))
  end
  return require(module .. '.' .. engine)
end

function _my.plugin(name, reconfigure)
  local module = string.format('layers.%s', name)
  local plugin = require(module)

  -- packer can't handle single wrapped plugin
  if 'table' == type(plugin) and 1 == #plugin and 'table' == type(plugin[1]) then
    plugin = plugin[1]
  else
    if plugin._config then
      plugin.config = 'require("' .. module .. '")._config()'
    end
  end

  return plugin
end
