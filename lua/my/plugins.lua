local plugins = require('my.packer.init')
local use = plugins.use
local plugin = plugins.plugin

use { 'wbthomason/packer.nvim', opt = true }
use { 'lewis6991/impatient.nvim' }
use { 'nvim-lua/plenary.nvim' }
-- https://github.com/svermeulen/vimpeccable
use { 'svermeulen/vimpeccable' }

plugin('my.plugins.which-key')
plugin('my.plugins.fuzzy')
plugin('my.plugins.lsp')
plugin('my.plugins.cmp')


use {
  'vitaly/vim-tmux-navigator',
  config = function ()
    vim.cmd [[
      noremap <silent> <plug>(Window/Up)    :TmuxNavigateUp<CR>
      noremap <silent> <plug>(Window/Down)  :TmuxNavigateDown<CR>
      noremap <silent> <plug>(Window/Left)  :TmuxNavigateLeft<CR>
      noremap <silent> <plug>(Window/Right) :TmuxNavigateRight<CR>

      nmap <leader>wk <plug>(Window/Up)
      nmap <leader>wj <plug>(Window/Down)
      nmap <leader>wh <plug>(Window/Left)
      nmap <leader>wl <plug>(Window/Right)

      cmap <silent> <m-k> :<C-U>TmuxNavigateUp<CR>
      cmap <silent> <m-j> :<C-U>TmuxNavigateDown<CR>
      cmap <silent> <m-h> :<C-U>TmuxNavigateLeft<CR>
      cmap <silent> <m-l> :<C-U>TmuxNavigateRight<CR>

      tmap <m-k> <C-\><C-n><plug>(Window/Up)
      tmap <m-j> <C-\><C-n><plug>(Window/Down)
      tmap <m-h> <C-\><C-n><plug>(Window/Left)
      tmap <m-l> <C-\><C-n><plug>(Window/Right)
    ]]
  end

}

use {
  'mbbill/undotree',
  config = function ()
    vim.cmd [[
      noremap             <plug>(Toggle/Unfo-Tree) :UndotreeToggle<CR>
      nmap    <leader>Tu  <plug>(Toggle/Unfo-Tree)

      " alias for quick access
      map                 <plug>(Toggle-Unfo-Tree) <plug>(Toggle/Unfo-Tree)
      nmap <leader>u      <plug>(Toggle-Unfo-Tree)

      nmap g= :later<cr>
   ]]
  end
}

use { 'chriskempson/base16-vim' }


puts 'my.plugins loaded'

return plugins
