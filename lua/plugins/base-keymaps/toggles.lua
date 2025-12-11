local config = require('onion.config')
config.set_defaults('toggle', {
  editor = {
    cursorcolumn = true,
    cursorline = true,
    relativenumber = true,
  },
})

local M = {}

-- toggle cursorcolumn in config, and set the editor setting accurdingly
function M.cursorcolumn() vim.opt.cursorcolumn = config.set('toggle.editor.cursorcolumn', not vim.opt.cursorcolumn:get()) end
function M.cursorline() vim.opt.cursorline = config.set('toggle.editor.cursorline', not vim.opt.cursorline:get()) end
function M.relativenumber() vim.opt.relativenumber = config.set('toggle.editor.relativenumber', not vim.opt.relativenumber:get()) end

function M.setup()
  vim.opt.cursorcolumn = config.get('toggle.editor.cursorcolumn', true)
  vim.opt.cursorline = config.get('toggle.editor.cursorline', true)
  vim.opt.relativenumber = config.get('toggle.editor.relativenumber', true)
end

return M
