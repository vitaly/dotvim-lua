return {

  {
    'guns/xterm-color-table.vim', -- https://github.com/guns/xterm-color-table.vim
    config = function()
      vim.g.XtermColorTableDefaultOpen = 'edit'

      require('which-key').register {
        ['<leader>'] = {
          sx = { '<cmd>XtermColorTable<cr>', 'Xtem Color Table' },
        },
      }
    end,
  },

  -- {
  --   'fgheng/winbar.nvim', -- https://github.com/fgheng/winbar.nvim

  --   after = {
  --     'nvim-base16',
  --   },

  --   config = function()
  --     my.au.on_colorscheme('winbar.style', function()
  --       local colors = require('base16-colorscheme').colors
  --       require('winbar').setup {
  --         enabled = true,
  --         show_file_path = true,

  --         -- for ref: pack/packer/start/base16-vim/colors/base16-ia-light.vim
  --         colors = {
  --           path = colors.base0D,
  --           file_name = colors.base08,
  --         },
  --       }
  --     end)
  --   end,
  -- },
}
