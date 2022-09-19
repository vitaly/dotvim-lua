local fn = vim.fn

vim.cmd [[packadd packer.nvim]]

local packer = require 'packer'

local border = 'rounded'
packer.startup({
  function(use)
    use { 'wbthomason/packer.nvim', opt = true }

    use 'lewis6991/impatient.nvim' -- https://github.com/lewis6991/impatient.nvim
    use 'nvim-lua/plenary.nvim' -- https://github.com/nvim-lua/plenary.nvim

    use 'folke/which-key.nvim' -- https://github.com/folke/which-key.nvim

    use {
      {
        'nvim-telescope/telescope-fzf-native.nvim', -- https://github.com/nvim-telescope/telescope-fzf-native.nvim
        run = 'make',
      },
      {
        'nvim-telescope/telescope.nvim',
        requires = {
          'nvim-lua/popup.nvim',
          'nvim-lua/plenary.nvim',
          'telescope-fzf-native.nvim',
          'nvim-telescope/telescope-fzy-native.nvim',
          'nvim-telescope/telescope-symbols.nvim',
          'nvim-telescope/telescope-dap.nvim', -- https://github.com/nvim-telescope/telescope-dap.nvim
        },

        wants = {
          'popup.nvim',
          'plenary.nvim',
          'telescope-fzf-native.nvim',
        },

        config = function()
          -- require 'my.plugins.fuzzy.config'
        end,
      },
    }

  end,

  config = {
    package_root = vim.fn.stdpath 'config' .. '/pack',

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
  },
})

local compiled_path = fn.stdpath('config') .. '/plugin/packer_compiled.lua'
local compiled = 0 == fn.empty(fn.glob(compiled_path))

print(vim.inspect(_my))

if _my.packer.updated then
  print "packer sync"
  packer.sync()

elseif not _my.packer.compiled then
  print "packer compile"
  packer.compile()

end
