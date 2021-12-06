vim.g.format_debug = false
local function toggle_format_debug()
  if vim.g.format_debug then
    print 'format debug off'
    vim.g.format_debug = false
  else
    print 'format debug on'
    vim.g.format_debug = true
  end
end

local which_key = require 'which-key'

which_key.register {
  ['<leader>T'] = {
    F = { toggle_format_debug, 'Format debug' },
  },
}
