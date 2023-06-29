vim.keymap.set('n', '<localleader>ee', [[yy:lua "<cr>]], { buffer = true, desc = 'Eval Line' })
vim.keymap.set('n', '<localleader>ef', [[<cmd>so %<cr>]], { buffer = true, desc = 'Eval File' })
