_G.__t = {}
_G._t = function(m) __t[#__t + 1] = m end

_G.my = _G.my or {}

_G.R = function(mod)
  package.loaded[mod] = nil
  return require(mod)
end

require('init.options')
require('init.log')
require('init.lazy')
require('init.autocommands')
require('init.commands')
