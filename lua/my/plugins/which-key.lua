-- TODO: switch to lua, use g:leader and g:localleader
return function (use)
  use {
    'liuchengxu/vim-which-key',
    setup = function ()
      -- TODO: convert to lua
      vim.cmd [[
        let g:WhichKeyFormatFunc = function('my#keymap#format')
        let g:which_key_sep = "|"

        nnoremap <silent>     <leader>                                    <CMD>WhichKey ' '<CR>
        nnoremap <silent>     <localleader>                               <CMD>WhichKey ','<CR>

        xnoremap <silent>     <leader>                                    <CMD>WhichKeyVisual ' '<CR>
        xnoremap <silent>     <localleader>                               <CMD>WhichKeyVisual ','<CR>

        call my#keymap#leader('s', '+Search')
        noremap                                 <plug>(Search/Keys)       <CMD>WhichKey ''<CR>
        nmap                  <leader>sk        <plug>(Search/Keys)
      ]]
      -- puts 'vim-which-key setup done!'
    end,
    config = function()
      vim.fn['which_key#register'](vim.g.mapleader, 'g:my#keymap#leader#map')
      vim.fn['which_key#register'](vim.g.maplocalleader, 'g:my#keymap#localleader#map')
    end,
  }
end
