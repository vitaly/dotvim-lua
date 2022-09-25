local engine = _my.config.filer
if not vim.tbl_contains({ 'nvimtree', 'neotree' }, engine) then
  error('invalid filer engine: ' .. engine)
end

return require('layers.filer.' .. engine)
