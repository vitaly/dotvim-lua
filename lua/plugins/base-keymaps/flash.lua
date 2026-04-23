-- put this somewhere you can require (or directly in your config)
local M = {}

local ns = vim.api.nvim_create_namespace('wrong_key_flash')

function M.flash(msg, opts)
  opts = opts or {}
  local win = opts.win or vim.api.nvim_get_current_win()
  local timeout = opts.timeout or 120

  -- define a loud highlight (adjust colors if you want)
  vim.api.nvim_set_hl(0, 'WrongKeyFlash', { fg = '#000000', bg = '#ff0044', bold = true })

  -- save current winhighlight
  local prev = vim.wo[win].winhighlight
  -- paint the whole window by remapping Normal/NormalNC
  vim.wo[win].winhighlight = (prev ~= '' and (prev .. ',') or '') .. 'Normal:WrongKeyFlash,NormalNC:WrongKeyFlash'

  -- optional: also echo a big message in command area
  if msg and msg ~= '' then vim.api.nvim_echo({ { msg, 'ErrorMsg' } }, true, {}) end

  -- restore shortly after
  vim.defer_fn(function()
    if vim.api.nvim_win_is_valid(win) then
      vim.wo[win].winhighlight = prev
      vim.cmd('redraw')
    end
  end, timeout)
end

return M
