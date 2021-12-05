-- require 'galaxyline.themes.eviline'
-- require 'galaxyline.themes.neonline'
-- require 'galaxyline.themes.spaceline'

-- LUALINE
require('lualine').setup {
  options = {
    -- theme = 'auto',
    theme = 'solarized',
    -- theme = 'Tomorrow',
    disabled_filetypes = { 'NvimTree', 'vista', 'dbui', 'packer' },
  },
}
