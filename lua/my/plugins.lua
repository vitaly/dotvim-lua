print 'my.plugins'

local plugins = require('my.packer.init')
local use = plugins.use
local plugin = plugins.plugin

use { 'wbthomason/packer.nvim', opt = true }
use { 'lewis6991/impatient.nvim' }
use { 'nvim-lua/plenary.nvim' }
use { 'svermeulen/vimpeccable',
  config = function ()
    require('vimp').unmap_all()
  end,
}

plugin('my.plugins.which-key')
plugin('my.plugins.fuzzy')

return plugins
