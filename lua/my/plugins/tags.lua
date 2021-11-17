return {
  'liuchengxu/vista.vim',
  config = function()
    map('<plug>Toggle(tagbar)', '<cmd>Vista!!<cr>')
    nmap('<leader>TT', '<plug>Toggle(tagbar)')
  end,
}
