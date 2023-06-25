-- lua/init/tools.lua

--------------------------------------------------------------------------------

my.config = my.config or {}

require 'init.tools.reload'
_G.REQUIRE = my.require
_G.RELOAD = my.reload

my.au = require 'init.tools.au'
my.ui = require 'init.tools.ui'

--------------------------------------------------------------------------------
-- layer name
-- accepts both NAME and layers.NAME, then returns NAME
function my.layer_path(module)
  return module:match '^layers%.(.+)' or module
end

--------------------------------------------------------------------------------
-- LAYERS

-- return module name
-- e.g. for foo.bar.baz will return baz
function my.module_name(module)
  return module:match '.*%.(.*)' or module
end

-- by convention, for layers that support multiple 'engines', the
-- current engine is stored in config[1]
-- this function retrieves it, given module name (from top of the module you can pass `...`)
-- and if you pass `variants`, the engine will be validated against it
function my.engine(module, variants)
  local name = my.module_name(module)
  local config = my.config[name] or {}

  local engine = config[1] or variants[1]
  if not engine then
    error 'need to either provide engine config or variants'
  end
  if variants and not vim.tbl_contains(variants, engine) then
    error(string.format("invalid engine '%s' for layer '%s'. valid engines: '%s'", engine, name, table.concat(variants, "', '")))
  end
  return require(module .. '.' .. engine)
end

function my.layer(name)
  local module = string.format('layers.%s', name)
  local plugin = require(module)

  -- packer can't handle single wrapped plugin
  if 'table' == type(plugin) and 1 == #plugin and 'table' == type(plugin[1]) then
    plugin = plugin[1]
  else
    -- if `config` uses anything from the file scope, it will fail
    -- in packer, since packer will only serialize `config` as is.
    -- if scope needs to be used, we can add `_config` instead
    -- in which case we set `config = 'require(module)._config()'`
    -- so that it will load the module and call `_config` which can use the scope
    if plugin._config then
      plugin.config = 'require("' .. module .. '")._config()'
    end
  end

  return plugin
end