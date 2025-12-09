local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
local clone_ok = require('lib.tools').git_clone(
  'https://github.com/folke/lazy.nvim.git',
  lazypath,
  '--branch=stable'
)

if not clone_ok then
  vim.notify('Failed to clone lazy.nvim. Plugin management disabled.', vim.log.levels.ERROR)
  return
end

vim.opt.rtp:prepend(lazypath)

require('lazy.core.handler.event').mappings.LazyFile =
  { id = 'LazyFile', event = { 'BufReadPost', 'BufNewFile', 'BufWritePre' } }

require('lazy').setup('plugins', {
  checker = { enabled = true, frequency = 3600 * 24 }, -- automatically check for plugin updates
  change_detection = { enabled = true, notify = false },
  install = { colorscheme = { 'tokyonight', 'habamax' } },
  performance = {
    rtp = {
      -- disable some rtp plugins
      disabled_plugins = {
        '2html_plugin',
        'getscript',
        'getscriptPlugin',
        'gzip',
        'logipat',
        'man',
        'matchit',
        'netrw',
        'netrwFileHandlers',
        'netrwPlugin',
        'netrwSettings',
        'rrhelper',
        'shada_plugin',
        'spellfile_plugin',
        'tar',
        'tarPlugin',
        'tohtml',
        'tutor',
        'vimball',
        'vimballPlugin',
        'zip',
        'zipPlugin',
      },
    },
  },
  ui = {
    border = 'rounded',
  },
})
