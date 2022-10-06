return {

  {
    'guns/xterm-color-table.vim', -- https://github.com/guns/xterm-color-table.vim
    config = function()
      require('layers.misc.config').setup()
    end,
  },
  {
    'fgheng/winbar.nvim', -- https://github.com/fgheng/winbar.nvim

    config = function()
      _my.au.on_colorscheme('winbar.style', function()
        local colors = {}
        if vim.g.base16_gui00 then
          colors = {
            path = '#' .. vim.g.base16_gui0D,
            file_name = '#' .. vim.g.base16_gui08,
          }
        end
        require('winbar').setup {
          enabled = true,
          show_file_path = true,

          -- for ref: pack/packer/start/base16-vim/colors/base16-ia-light.vim
          colors = colors,
        }
      end)
    end,
  },
}
