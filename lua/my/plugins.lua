vim.cmd 'packadd packer.nvim'

local border = 'rounded'
local packer = nil
if packer == nil then
  packer = require 'packer'
  packer.init {
    package_root = vim.fn.stdpath 'config' .. '/pack',
    disable_commands = true,
    -- profile = {
    --   enable = true,
    --   threshold = 1,
    -- },
    display = {
      open_fn = function()
        return require('packer.util').float { border = border }
      end,
      prompt_border = border,
    },
  }
end

packer.reset()
local use = packer.use

local function plugin(name)
  use(REQUIRE('my.plugins.' .. name))
end

use { 'wbthomason/packer.nvim', opt = true }

use 'lewis6991/impatient.nvim'
use 'nvim-lua/plenary.nvim'
use 'svermeulen/vimpeccable'

plugin 'which-key'
plugin 'fuzzy'
plugin 'lsp'
plugin 'cmp'
plugin 'tmux-navigator'
plugin 'undo-tree'
plugin 'treesitter'
plugin 'languages'
-- plugin 'filer/chad-tree'
plugin 'filer/nvim-tree'
plugin 'git'
plugin 'comments'
plugin 'zoom'
plugin 'statusline'
plugin 'tags'
plugin 'blankline'
plugin 'diminactive'
plugin 'words'
plugin 'misc'
plugin 'neorg'
plugin 'autoformat'
plugin 'debug'
-- plugin 'neogen'

local m = {}
m.refresh = function()
  if vim.b.packer_ignore then
    vim.b.packer_ignore = false
  else
    packer.install()
  end
end
return m
