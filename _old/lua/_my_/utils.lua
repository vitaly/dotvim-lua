local m = {}

local vimp = require 'vimp'

vimp.always_override = true

for _, f in ipairs { 'map', 'noremap', 'nmap', 'nnoremap', 'xmap', 'xnoremap', 'cmap', 'cnoremap', 'imap', 'inoremap' } do
  _G[f] = vimp[f]
end

return m
