local M = {}

-- take background from one highlight and apply it to the other
function M.hl_bg_copy(from, to, extra)
  extra = extra or ''
  local bg = vim.fn.synIDattr(vim.fn.hlID(from), 'bg')
  if bg ~= '' then
    local hl = 'hi ' .. to .. ' guibg=' .. bg .. ' ' .. extra
    -- vim.notify(hl, vim.log.levels.DEBUG)
    vim.cmd(hl)
  else
    vim.notify(string.format('no bg for %s', from), vim.log.levels.WARN)
  end
end

-- make sure that the given highlight has background equal to that of SignColumn
function M.sign_hi(name, extra)
  M.hl_bg_copy('SignColumn', name, extra)
end

return M
