-- lua/layers/ide/tagbar/init.lua

return {
  _my.engine(..., { 'sidebar', 'outline', 'visgta' }),
  require 'layers.ide.tagbar.aerial',
}
