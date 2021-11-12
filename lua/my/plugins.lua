print 'my.plugins'

local plugins = require('my.packer.init')
local use = plugins.use
local plugin = plugins.plugin

use { 'wbthomason/packer.nvim', opt = true }
use { 'svermeulen/vimpeccable' }
use { 'lewis6991/impatient.nvim' }

plugin('my.plugins.which-key')

return plugins
