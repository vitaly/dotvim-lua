local eval = require('lib.eval')

vim.keymap.set('n', '<localleader>ee', function()
  vim.fn.feedkeys('V', 'x')
  eval.run_scratch({ buf = vim.api.nvim_get_current_buf() }, { 'bun', 'run', '-' })
  vim.fn.feedkeys(vim.api.nvim_replace_termcodes('<esc>', true, false, true), 'nx')
end, { buffer = true, silent = true, desc = 'Eval line' })

vim.keymap.set({ 'n', 'x' }, '<localleader>e<cr>', function()
  eval.bun_ts({ buf = vim.api.nvim_get_current_buf() })
end, { buffer = true, silent = true, desc = 'Eval line-by-line' })

vim.keymap.set({ 'n', 'x' }, '<localleader>e<m-cr>', function()
  eval.run_scratch({ buf = vim.api.nvim_get_current_buf() }, { 'bun', 'run', '-' })
end, { buffer = true, silent = true, desc = 'Run file' })
