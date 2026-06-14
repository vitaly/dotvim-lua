vim.keymap.set('n', '<localleader>ee', function()
  vim.fn.feedkeys('V', 'x')
  Snacks.debug.run()
  vim.fn.feedkeys(vim.api.nvim_replace_termcodes('<esc>', true, false, true), 'nx')
end, { buffer = true, silent = true, desc = 'Eval line' })

vim.keymap.set({ 'n', 'x' }, '<localleader>e<cr>', Snacks.debug.run,
  { buffer = true, silent = true, desc = 'Eval (Snacks)' })
