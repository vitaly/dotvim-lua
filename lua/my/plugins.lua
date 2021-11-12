print 'loading my.plugins'

local plugins = require('my.packer.init')
local use = plugins.use
local plugin = plugins.plugin

use { 'wbthomason/packer.nvim', opt = true }
use { 'lewis6991/impatient.nvim' }
use { 'nvim-lua/plenary.nvim' }
use { 'svermeulen/vimpeccable' }

plugin('my.plugins.which-key')
plugin('my.plugins.fuzzy')

print 'my.plugins loaded'

return plugins
