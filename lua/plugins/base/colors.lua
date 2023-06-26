-- TODO: Add support for Base16 and shell integration

local function define_load_vimrc_background_command()
  vim.api.nvim_create_user_command('LoadVimrcBackground', function()
    vim.cmd [[
          if filereadable(expand("~/.vimrc_background"))
            try | source ~/.vimrc_background | catch | echo "colorscheme load error" | endtry
          endif
        ]]
  end, {
    nargs = 0,
  })
end

return {
  { 'folke/tokyonight.nvim', lazy = true, priority = 1000 }, -- https://github.com/folke/tokyonight.nvim

  {
    'RRethy/nvim-base16', -- https://github.com/RRethy/nvim-base16
    lazy = false,
    priority = 1000,

    keys = {
      { '<plug>(Vim/Update-Colors)', '<cmd>LoadVimrcBackground<cr>' },
      { '<leader>vc', '<plug>(Vim/Update-Colors)', remap = false },
    },

    config = function()
      -- setup handler for adjusting base16 colors for diff-mode
      -- need to do this before we acrually change into the base16 colorscheme
      require('plugins.base.colors.diff_mode').setup()

      define_load_vimrc_background_command()

      if my.config.colorscheme == '-load' then
        vim.cmd.LoadVimrcBackground()
      else
        vim.cmd('colorscheme ' .. my.config.colorscheme)
      end
    end,
  },
}
