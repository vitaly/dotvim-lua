return {
  'liuchengxu/vista.vim',
  config = function()
    vim.g.vista_default_executive = 'nvim_lsp'
    map('<plug>Toggle(Tagbar)', '<cmd>Vista!!<cr>')
    nmap('<leader>TT', '<plug>Toggle(Tagbar)')
  end,
}
