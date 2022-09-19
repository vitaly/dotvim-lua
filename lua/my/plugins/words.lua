return {
  'lfv89/vim-interestingwords',
  setup = function()
    vim.g.interestingWordsGUIColors = {
      '#ff0000',
      '#00ff00',
      '#0000ff',
      '#ffff00',
      '#00ffff',
      '#ff00ff',
      '#888888',
      '#880000',
      '#008800',
      '#000088',
      '#888800',
      '#008888',
      '#880088',
      '#8800ff',
      '#88aaff',
      '#ff8800',
      '#ff4488',
      '#ffffff',
    }
    -- vim.g.interestingWordsRandomiseColors = 1
  end,
  config = function()
    vim.cmd [[
        nnoremap <silent> n <cmd>call WordNavigation(1)<cr><cmd>set hls<cr>zz
        nnoremap <silent> N <cmd>call WordNavigation(0)<cr><cmd>set hls<cr>zz
      ]]
  end,
}
