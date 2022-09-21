
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
-- plugin 'navigator'

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
plugin 'focus'
plugin 'words'
plugin 'misc'
plugin 'minimap'
plugin 'neorg'
plugin 'autoformat'
plugin 'debug'
plugin 'cursors'
-- plugin 'neogen'

-- FIXME: move this out of here
local m = {}
m.refresh = function()
  if vim.b.packer_refresh ~= 0 then
    -- vim.cmd [[echo 'installing']]
    packer.install()
    -- else
    --   vim.cmd [[echo 'ignoring']]
  end
end
return m
