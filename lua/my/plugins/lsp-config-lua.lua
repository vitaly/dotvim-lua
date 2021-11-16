return function(opts)
  opts.settings = {
    Lua = {
      diagnostics = {
        globals = {
          'vim',
          'map',
          'noremap',
          'nmap',
          'nnoremap',
          'xmap',
          'xnoremap',
          'cmap',
          'cnoremap',
          'imap',
          'inoremap',
        },
      },
      -- runtime = { version = 'LuaJIT', path = vim.split(package.path, ';') },
      -- workspace = {
      --   library = {
      --     [vim.fn.expand '$VIMRUNTIME/lua'] = true,
      --     [vim.fn.expand '$VIMRUNTIME/lua/vim/lsp'] = true,
      --   },
      -- },
    },
  }
end
