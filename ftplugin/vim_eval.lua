vim.keymap.set('n', '<localleader>ee', [[yy:@"<cr>]], { buffer = true, desc = 'Eval Line' })
vim.keymap.set('n', '<localleader>ef', [[<cmd>so %<cr>]], { buffer = true, desc = 'Eval File' })
vim.keymap.set('x', '<localleader>e', [[y:@"<cr>]], { buffer = true, desc = 'Eval File' })
