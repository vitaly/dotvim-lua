return {
  'neovim/nvim-lspconfig', -- https://github.com/neovim/nvim-lspconfig
  opts = {
    servers = {
      lua_ls = {
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
                'vim', 'my'
              },
            },

            workspace = {
              checkThirdParty = false,
              -- Make the server aware of Neovim runtime files
              library = {
                [vim.fn.expand '$VIMRUNTIME/lua'] = true,
                [vim.fn.expand '$VIMRUNTIME/lua/vim/lsp'] = true,
              },
            },

            telemetry = { enable = false },
          },
        },
      },
    },
  },
}
