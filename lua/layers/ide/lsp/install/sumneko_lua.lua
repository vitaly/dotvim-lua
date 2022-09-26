return {
  setup = function(defaults)
    require('lspconfig').sumneko_lua.setup(vim.tbl_deep_extend('force', defaults, {

      -- cmd = { 'lua-language-server', '--loglevel=trace' },
      settings = {
        Lua = {
          runtime = { version = 'LuaJIT' },

          completion = {
            callSnippet = 'Replace',
            displayContext = 5,
            keywordSnippet = 'Replace',
          },

          hint = { enable = true },

          diagnostics = {
            -- stylua: ignore
            globals = {
              'vim',
              'cmd', 'cmdbang',
              'map', 'noremap',
              'nmap', 'nnoremap',
              'vmap', 'vnoremap',
              'xmap', 'xnoremap',
              'smap', 'snoremap',
              'omap', 'onoremap',
              'imap', 'inoremap',
              'lmap', 'lnoremap',
              'cmap', 'cnoremap',
              'tmap', 'tnoremap',
            },
          },

          workspace = {
            -- Make the server aware of Neovim runtime files
            library = vim.api.nvim_get_runtime_file('', true),
            -- library = {
            --   [vim.fn.expand '$VIMRUNTIME/lua'] = true,
            --   [vim.fn.expand '$VIMRUNTIME/lua/vim/lsp'] = true,
            -- },
          },

          telemetry = { enable = false },
        },
      },
    }))
  end,
}
