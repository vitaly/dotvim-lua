return {
  'tpope/vim-commentary', -- https://github.com/tpope/vim-commentary/
  config = function()
    nmap('<plug>Toggle(comment)', 'gcc')
    xmap('<plug>Toggle(comment)', 'gc')

    require('which-key').register({
      ['<leader>'] = {
        [';'] = { 'gcu', 'Uncomment Region' },
      },

      ['\\'] = {
        [';'] = { 'gcc', 'Comment' }
      },
    }, { noremap = false })


    require('which-key').register({
      ['\\'] = {
        [';'] = { 'gc', 'Comment' }
      },
    }, { noremap = false, mode = 'x' })
  end,
}
