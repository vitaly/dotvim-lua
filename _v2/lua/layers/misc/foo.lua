return {
  config = function()
    vim.api.nvim_create_user_command('Foo', function()
      print 'find and edit this in layers/misc/foo.lua'
    end, { nargs = 0 })

    require('which-key').register {
      ['<leader>'] = {
        [','] = { foo, 'Foo' },
      },
    }
  end,
}
