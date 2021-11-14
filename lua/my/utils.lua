local m = {}


local vimp = require('vimp')

for _,f in ipairs({ 'map', 'noremap', 'nmap', 'nnoremap', 'xmap', 'xnoremap', 'cmap', 'cnoremap', 'imap', 'inoremap' }) do
  _G[f] = vimp[f]
end


return m
