local M = {}

vim.api.nvim_set_hl(0, 'AutoformatEnabled', { fg = '#5FD7FF', bold = true })
vim.api.nvim_set_hl(0, 'AutoformatDisabled', { fg = '#6c7086' })

local glue = require('glue').register('plugins/statusline')

local icon = '󰅩'
local disabled = '%#AutoformatDisabled#'
local enabled = '%#AutoformatEnabled#'

---@param bufnr? number
function M.status(bufnr)
  if not bufnr then
    bufnr = vim.api.nvim_get_current_buf()
  end

  local status = glue.ask('autoformat.status', { bufnr = bufnr })

  if not status.enabled then
    return disabled .. icon
  end

  return enabled .. icon
end

return M
