
-- ensure core packages are installed
-- define packer commands
require 'my.core.install'
-- import vimp binding funcs into global
require 'my.utils'
require 'my.builtins'
require 'my.options'

-- local g = vim.g
-- local cmd = vim.cmd
-- local o, wo, bo = vim.o, vim.wo, vim.bo
-- local fn = vim.fn

-- lua/my/options.lua
-- lua/my/plugins.lua
--
-- ~/dev/src/github.com/NvChad/NvChad/lua/core/options.lua
-- ~/dev/src/github.com/NvChad/NvChad/lua/core/default_config.lua
-- ~/dev/src/github.com/tjdevries/config_manager/xdg_config/nvim/plugin/options.lua