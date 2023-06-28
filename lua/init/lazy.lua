local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
require('lib.tools').ensure_cloned('https://github.com/folke/lazy.nvim.git', lazypath, '--branch=stable')
vim.opt.rtp:prepend(lazypath)

require('lazy').setup('plugins', {
  checker = { enabled = true }, -- automatically check for plugin updates
  change_detection = { notify = false },
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
        'matchparen',
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
})
