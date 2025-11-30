local au = require 'lib.au'

local setup_autocommands = function()
  -- Highlight on yank
  au.command('highlight.on_yank', 'TextYankPost', function()
    vim.hl.on_yank { timeout = 200, on_visual = false }
  end)

  -- disable paste mode when leaving Insert Mode
  au.command('disable.paste_mode', 'InsertLeave', function()
    vim.opt.paste = false
  end)
end

-- if 'number of files in the argument list' is not zero, setup autocommands immediately
-- otherwise set it up on 'User' event, pattern 'VerLazy'
if vim.fn.argc() > 0 then
  setup_autocommands()
else
  au.command('setup.autocommands', 'User', function()
    setup_autocommands()
  end, { pattern = 'VeryLazy' })
end
