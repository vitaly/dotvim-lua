-- lua/layers/terminal/tmux.lua

return {
  'vitaly/vim-tmux-navigator',

  config = function()

    local up    = '<cmd>TmuxNavigateUp<cr>'
    local down  = '<cmd>TmuxNavigateDown<cr>'
    local left  = '<cmd>TmuxNavigateLeft<cr>'
    local right = '<cmd>TmuxNavigateRight<cr>'

    nmap('<leader>wk', up, 'silent', 'Navigate Up')
    nmap('<leader>wj', down, 'silent', 'Navigate Down')
    nmap('<leader>wh', left, 'silent', 'Navigate Left')
    nmap('<leader>wl', right, 'silent', 'Navigate Right')

    tmap('<m-k>', '<c-\\><c-n>' .. up, 'silent')
    tmap('<m-j>', '<c-\\><c-n>' .. down, 'silent')
    tmap('<m-h>', '<c-\\><c-n>' .. left, 'silent')
    tmap('<m-l>', '<c-\\><c-n>' .. right, 'silent')

    cmap('<m-k>', up, 'silent')
    cmap('<m-j>', down, 'silent')
    cmap('<m-h>', left, 'silent')
    cmap('<m-l>', right, 'silent')
  end,
}
