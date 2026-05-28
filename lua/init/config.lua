local onion_path = _G._onion_nvim_path_ or vim.fn.stdpath('data') .. '/lazy/onion.nvim'
local clone_ok = require('lib.tools').git_clone('https://github.com/vitaly/onion.nvim.git', onion_path, '--depth=1')

if not clone_ok then
  vim.notify('Failed to clone onion.nvim. Onion Config disabled.', vim.log.levels.ERROR)
  return
end

vim.opt.rtp:prepend(onion_path)

require('onion.config').setup({
  save_path = vim.fn.stdpath('config') .. '/config.lua',
  auto_save = true,

  defaults = {
    log_level = vim.log.levels.WARN,
  },
})
