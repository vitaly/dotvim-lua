
-- local lspkind = require('lspkind')

vim.lsp.handlers['textDocument/publishDiagnostics'] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
  virtual_text = false,
  signs = true,
  update_in_insert = false,
  underline = true,
})

local defaults = REQUIRE('my.plugins.lsp-config-default')

local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

REQUIRE('nvim-lsp-installer').on_server_ready(function(server)
  local opts = defaults()

  opts.on_attach = on_attach
  opts.capabilities = capabilities

  if server.name == 'sumneko_lua' then
    REQUIRE('my.plugins.lsp-config-lua')(opts)
  end

  if server.name == 'tsserver' then
    opts.on_attach = function(client, bufnr)
      client.resolved_capabilities.document_formatting = false
      client.resolved_capabilities.document_range_formatting = false
      return on_attach(client, bufnr)
    end
  end

  -- This setup() function is exactly the same as lspconfig's setup function.
  -- Refer to https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
  server:setup(opts)
end)

-- print "lsp-config loaded"
