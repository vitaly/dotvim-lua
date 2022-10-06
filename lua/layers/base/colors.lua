-- lua/layers/base/colors.lua
--
-- NOTE: new base16 doesn't update .vimrc_background file
-- instead we have a BASE16_HOOK doing it instead

return {
  'RRethy/nvim-base16', -- https://github.com/RRethy/nvim-base16

  config = function()
    cmdbang('LoadVimrcBackground', function()
      vim.cmd [[
        if filereadable(expand("~/.vimrc_background"))
          try | source ~/.vimrc_background | catch | echo "colorscheme load error" | endtry
        endif
      ]]
    end)

    vim.cmd [[LoadVimrcBackground]]

    nnoremap('<plug>(Vim/Update-Colors)', ':LoadVimrcBackground<CR>')
    nmap('<leader>vc', '<plug>(Vim/Update-Colors)', 'silent')
  end,
}
