-- lua/init/plugins.lua
---@diagnostic disable: different-requires

my.reload 'layers.'

local function LAYER(name)
  -- log.debug('loading layer ' .. name)

  USE(my.layer(name))
end

LAYER 'ide.tagbar'
LAYER 'ide.minimap'

LAYER 'ui.statusline'
LAYER 'ui.blankline'

LAYER 'obsidian'

LAYER 'misc'

LAYER 'neorg'

return packer
