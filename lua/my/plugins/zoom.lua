return {
  'troydm/zoomwintab.vim',
  config = function()
    noremap('<plug>(Window/Toggle-Zoom)', '<cmd>ZoomWinTabToggle<cr>')

    nmap('<leader>wz', '<plug>(Window/Toggle-Zoom)')
  end,
}
