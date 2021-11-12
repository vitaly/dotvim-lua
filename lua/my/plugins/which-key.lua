-- TODO: switch to lua, use g:leader and g:localleader
return function (use)
  use {
    'liuchengxu/vim-which-key',
    config = function()
      vim.cmd [[
        let g:WhichKeyFormatFunc = function('my#keymap#format')

        augroup RegisterKeyMap
          autocmd!
          autocmd   User    vim-which-key     call which_key#register(g:mapleader, 'g:my#keymap#leader#map')
          autocmd   User    vim-which-key     call which_key#register(g:maplocalleader, 'g:my#keymap#localleader#map')
        augroup END

        nnoremap <silent>     <leader>                                    <CMD>WhichKey ' '<CR>
        nnoremap <silent>     <localleader>                               <CMD>WhichKey ','<CR>

        xnoremap <silent>     <leader>                                    <CMD>WhichKeyVisual ' '<CR>
        xnoremap <silent>     <localleader>                               <CMD>WhichKeyVisual ','<CR>

        noremap                                 <plug>(Search/Keys)       <CMD>WhichKey ''<CR>
        nmap                  <leader>sk        <plug>(Search/Keys)

        let g:which_key_sep = "|"
      ]]
      print "which key loaded"
    end,
  }
end
