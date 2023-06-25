-- global utilities
require 'init.tools'

-- load custom config
require 'init.config'

-- 'impatient' is used to cache the compiled lua files
-- use `:LuaCacheClear` to clear the cache
my.config.impatient = { profile = true }

-- disable unnecessary features
require 'init.builtins'

-- set vim options
require 'init.options'

-- install core packages, e.g. packer itself
require 'init.bootstrap'

-- initialize packer
require 'init.packer'
