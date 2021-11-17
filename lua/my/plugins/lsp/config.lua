-- local lspkind = require('lspkind')

vim.lsp.handlers['textDocument/publishDiagnostics'] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
  virtual_text = false,
  signs = true,
  update_in_insert = false,
  underline = true,
})

local on_attach = REQUIRE 'my.plugins.lsp.on-attach'

local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

require('lspconfig').solargraph.setup {
  cmd = { 'binx', 'solargraph', 'stdio' },
  settings = {
    solargraph = {
      useBundler = true,
      trace = {
        server = 'verbose',
      },
      logLevel = 'debug',
    },
  },
}

local configure_server = function(server)
  local opts = {
    on_attach = on_attach,
    flags = { debounce_text_changes = 150 },
    capabilities = capabilities,
  }

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
  end

  if server.name == 'tsserver' then
    opts.on_attach = function(client, bufnr)
      client.resolved_capabilities.document_formatting = false
      client.resolved_capabilities.document_range_formatting = false
      return on_attach(client, bufnr)
    end
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

-- print "lsp-config loaded"
