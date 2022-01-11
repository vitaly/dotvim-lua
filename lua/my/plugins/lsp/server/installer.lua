return {
  setup = function(defaults)
    local configure_server = function(server)
      local opts = vim.tbl_extend('force', defaults, {
        flags = { debounce_text_changes = 150 },
      })

      if server.name == 'sumneko_lua' then

    -- stylua: ignore
    opts.settings = {
      Lua = {
        diagnostics = {
          globals = { 'vim', 'map', 'noremap', 'nmap', 'nnoremap', 'xmap', 'xnoremap', 'cmap', 'cnoremap', 'imap', 'inoremap', },
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
        -- elseif server.name == 'tsserver' then
        --   opts.on_attach = function(client, bufnr)
        --     client.resolved_capabilities.document_formatting = false
        --     client.resolved_capabilities.document_range_formatting = false
        --     return on_attach(client, bufnr)
        --   end
      elseif server.name == 'solargraph' then
        opts.settings = {
          useBundler = true,
          cmd = { 'bundle', 'exec', 'solargraph', 'stdio' },
          cmd_env = {},
          solargraph = {
            useBundler = true,
            trace = {
              server = 'verbose',
            },
            logLevel = 'debug',
          },
        }
      end

      -- PRINT(server.name, opts.settings)
      -- This setup() function is exactly the same as lspconfig's setup function.
      -- Refer to https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
      server:setup(opts)
    end

    require('nvim-lsp-installer').on_server_ready(configure_server)
  end,
}
