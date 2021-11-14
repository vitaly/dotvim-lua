local m = {}


local vimp = require('vimp')

for _,f in ipairs({ 'map', 'nmap', 'xmap', 'cmap', 'noremap' }) do
  _G[f] = vimp[f]
end


return m
