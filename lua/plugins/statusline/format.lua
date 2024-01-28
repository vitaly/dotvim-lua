local M = {}

local utils = require 'plugins.statusline.utils'

---@param bufnr? number
function M.status(bufnr)
  if not bufnr then
    bufnr = vim.api.nvim_get_current_buf()
  end
  local lsp_format = require 'lsp-format'

  if lsp_format.disabled then
    return 'D'
  end

  if lsp_format.disabled_filetypes[utils.filetype()] then
    return 'd'
  end

  return 'A'
end

-- ---@param bufnr? number
-- function M.writing(bufnr)
--   if not bufnr then
--     bufnr = vim.api.nvim_get_current_buf()
--   end
--   local lsp_format = require 'lsp-format'
--   if lsp_format.saving_buffers[bufnr] then
--     return 'W'
--   end
--
--   return ''
-- end

return M
