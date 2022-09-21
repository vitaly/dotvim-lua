return  {
  'chriskempson/base16-vim', -- https://github.com/chriskempson/base16-vim

  after = 'keymaps',
  config = function()
    cmdbang('LoadVimrcBackground', function()
      vim.cmd[[
        if filereadable(expand("~/.vimrc_background"))
          let base16colorspace=256
          try | source ~/.vimrc_background | catch | echo "colorscheme load error" | endtry
        endif
      ]]
    end)

    vim.cmd[[LoadVimrcBackground]]

    nnoremap('<plug>(Vim/Update-Colors)', ':LoadVimrcBackground<CR>')
    nmap('<leader>vc', '<plug>(Vim/Update-Colors)', 'silent')
  end,
}
