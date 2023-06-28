local au = require 'lib.au'

local setup_autocommands = function()
  -- restore cursor position when opening files
  au.command('last-location', 'BufReadPost', function()
    local ft = vim.api.nvim_get_option_value('filetype', { buf = 0 })
    -- do not restore cursor for these filetypes
    if ft == 'gitcommit' or ft == 'gitrebase' then
      return
    end
    local mark = vim.api.nvim_buf_get_mark(0, '"')
    local lcount = vim.api.nvim_buf_line_count(0)
    if mark[1] > 0 and mark[1] <= lcount then
      pcall(vim.api.nvim_win_set_cursor, 0, mark)
    end
  end)

  -- Highlight on yank
  au.command('highlight.on_yank', 'TextYankPost', function()
    vim.highlight.on_yank { timeout = 200, on_visual = false }
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
