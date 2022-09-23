vim.cmd [[packadd packer.nvim]]

local packer = require 'packer'

-------------------------------------------------------------------------------------------------
-- PACKER INIT ----------------------------------------------------------------------------------
local border = 'rounded'
packer.init({
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
  log = { level = 'trace' },
})

packer.reset()


-------------------------------------------------------------------------------------------------
-- PACKER PLUGINS -------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------
-- some plugins are combined into 'bundles' called layers.

local use = packer.use

local function layer(name)
  use(REQUIRE('layers.' .. name))
end

-- those are the basic plugins installed during bootstrap
use { 'wbthomason/packer.nvim', opt = true } -- https://github.com/wbthomason/packer.nvim
use 'lewis6991/impatient.nvim'               -- https://github.com/lewis6991/impatient.nvim
use 'nvim-lua/plenary.nvim'                  -- https://github.com/nvim-lua/plenary.nvim

layer 'base.utils'
layer 'base.keymaps'
layer 'base.colors'

layer 'filer.nvimtree'
-- layer 'filer/neotree'

layer 'fuzzy'
layer 'terminal.tmux'

layer 'dev.git'
layer 'dev.tags'

layer 'ide.tsitter'
layer 'ide.lsp'
layer 'ide.cmp'

layer 'editor'
layer 'focus'


return packer
