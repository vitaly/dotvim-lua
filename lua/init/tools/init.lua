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
