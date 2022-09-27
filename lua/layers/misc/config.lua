function foo()
  print 'find and edit this in layers/misc/config.lua'
end

vim.api.nvim_create_user_command('Foo', foo, { nargs = 0 })

return {
  setup = function()
    vim.g.XtermColorTableDefaultOpen = 'edit'

    require('which-key').register {
      ['<leader>'] = {
        sx = { '<cmd>XtermColorTable<cr>', 'Xtem Color Table' },

        [','] = { foo, 'Foo' },
      },
    }
  end,
}
