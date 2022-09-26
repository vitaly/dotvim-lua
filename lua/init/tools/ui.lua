local M = {}

-- take background from one highlight and apply it to the other
function M.hl_bg_copy(from, to, extra)
  extra = extra or ''
  local hl = 'hi ' .. to .. ' guibg=' .. vim.fn.synIDattr(vim.fn.hlID(from), 'bg') .. ' ' .. extra
  vim.cmd(hl)
end

-- make sure that the given highlight has background equal to that of SignColumn
function M.sign_hi(name, extra)
  M.hl_bg_copy('SignColumn', name, extra)
end

return M
