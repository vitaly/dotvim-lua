-- lua/layers/ide/tagbar/init.lua

return {
  my.engine(..., { 'sidebar', 'outline', 'visgta' }),
  require 'layers.ide.tagbar.aerial',
}
