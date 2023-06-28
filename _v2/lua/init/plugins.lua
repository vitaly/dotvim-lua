-- lua/init/plugins.lua
---@diagnostic disable: different-requires

my.reload 'layers.'

local function LAYER(name)
  -- log.debug('loading layer ' .. name)

  USE(my.layer(name))
end

LAYER 'filer'

LAYER 'telescope'

LAYER 'ide.tsitter'
LAYER 'ide.lsp'
LAYER 'ide.cmp'
LAYER 'ide.format'
LAYER 'ide.tagbar'
LAYER 'ide.minimap'

LAYER 'dev.git'
LAYER 'dev.colors'

LAYER 'editor'
LAYER 'cursors'
LAYER 'focus'

LAYER 'ui.statusline'
LAYER 'ui.blankline'

LAYER 'obsidian'

LAYER 'misc'

LAYER 'neorg'

return packer
