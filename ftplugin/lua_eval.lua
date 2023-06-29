vim.keymap.set('n', '<localleader>ee', [[yy:lua "<cr>]], { buffer = true, silent = true, desc = 'Eval Line' })
vim.keymap.set('n', '<localleader>ef', [[<cmd>so %<cr>]], { buffer = true, silent = true, desc = 'Eval File' })
