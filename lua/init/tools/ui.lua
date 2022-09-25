local M = {}

-- make sure that the given highlight has background equal to that of SignColumn
function M.sign_hi(name, extra)
  extra = extra or ''
  local hl = 'hi ' .. name .. ' guibg=' .. vim.fn.synIDattr(vim.fn.hlID 'SignColumn', 'bg') .. ' ' .. extra
  vim.cmd(hl)
end

return M
