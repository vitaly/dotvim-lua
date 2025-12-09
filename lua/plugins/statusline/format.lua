local M = {}

vim.api.nvim_set_hl(0, 'AutoformatEnabled', { fg = '#5FD7FF', bold = true })
vim.api.nvim_set_hl(0, 'AutoformatDisabled', { fg = '#6c7086' })

local glue = require('glue').register('plugins/statusline')

local icon = '󰅩'
local disabled = '%#AutoformatDisabled#'
local enabled = '%#AutoformatEnabled#'

function M.status()
  local bufnr = vim.api.nvim_get_current_buf()
  local status = glue.call('autoformat.status', { bufnr = bufnr })

  if status.enabled then return enabled .. icon end

  if not status.buffer then return disabled .. icon .. ' b' end
  if not status.filetype then return disabled .. icon .. ' ft' end
  return disabled .. icon
end

return M
