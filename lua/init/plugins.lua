-- lua/init/plugins.lua
---@diagnostic disable: different-requires

local log = _my.log
log.debug 'loading init.plugins'

vim.cmd [[packadd packer.nvim]]

local packer = require 'packer'

-------------------------------------------------------------------------------------------------
-- PACKER INIT ----------------------------------------------------------------------------------
local border = 'rounded'
packer.init {
  -- TODO: place the compiled file inside 'lua' so that it's cached by 'impatient'. be sure to profile the result difference
  package_root = _my.packer.ROOT,

  disable_commands = true,

  profile = {
    enable = true,
    threshold = 0,
  },

  display = {
    open_fn = function()
      return require('packer.util').float { border = border }
    end,
    prompt_border = border,
  },
  -- log = { level = 'warning' },
  log = { level = 'trace' },
}

packer.reset()

local USE = packer.use

_my.reload 'layers.'

local function LAYER(name)
  -- log.debug('loading layer ' .. name)

  USE(_my.layer(name))
end

-- those are the basic plugins installed during bootstrap
USE { 'wbthomason/packer.nvim', opt = true } -- https://github.com/wbthomason/packer.nvim
USE 'lewis6991/impatient.nvim' -- https://github.com/lewis6991/impatient.nvim
USE 'nvim-lua/plenary.nvim' -- https://github.com/nvim-lua/plenary.nvim

USE {
  'folke/tokyonight.nvim',

  -- config = function()
  --   require('tokyonight').setup {
  --     style = 'moon',
  --     -- styles = { comments = "italic" },
  --     -- transparent = true,
  --     -- dark_sidebar = true,
  --     -- dark_float = true,
  --     -- sidebars = { "qf", "vista_kind", "terminal", "packer" },
  --     -- colors = { hint = "orange", error = "#ff0000" },
  --   }
  -- end,
}

LAYER 'base.utils'
LAYER 'base.keymaps'
LAYER 'base.colors'

LAYER 'filer'

LAYER 'telescope'
LAYER 'terminal'

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
