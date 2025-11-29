-- local debug = my.log.debug
-- local trace = my.log.trace
return {

  setup = function(opts)
    -- local folding_capabilities = {
    --   textDocument = {
    --     foldingRange = {
    --       dynamicRegistration = false,
    --       lineFoldingOnly = true,
    --     },
    --   },
    -- }
    local default_capabilities = vim.tbl_deep_extend(
      'force',
      {},
      vim.lsp.protocol.make_client_capabilities(),
      -- folding_capabilities,
      require('cmp_nvim_lsp').default_capabilities(),
      opts.capabilities or {}
    )
    local defaults = { capabilities = default_capabilities }

    local servers = opts.servers
    -- this handler is called by mason-lspconfig when mason installs a server
    -- default handler will just setup server with lspconfig
    -- can owerride via opts.setup[name] or opts.setup['*']
    -- handler is called with defaults merged with opts.servers[name]
    local function default_setup_handler(name, config)
      -- trace { 'lspconfig', name, vim.tbl_keys(config) }
      require('lspconfig')[name].setup(config)
    end
    local function setup_server(name)
      -- trace { 'setup_server', name }
      local setup_handler = opts.setup and (opts.setup[name] or opts.setup['*']) or default_setup_handler
      local config = vim.tbl_deep_extend('force', vim.deepcopy(defaults), servers[name] or {})
      -- trace { 'setup_handler', name, vim.tbl_keys(config) }
      setup_handler(name, config)
    end

    -- for every server in servers:
    -- * if server.mason = false - setup server directly via setup_handler(name)
    -- * otherwise add name to ensure_installed, and it will in turn trigger setup_handler once installed
    local ensure_installed = opts.ensure_installed or {}
    for name, server in pairs(servers) do
      if server.mason == false then
        setup_server(name)
      else
        table.insert(ensure_installed, name)
      end
    end

    -- make sure ensure_installed is unique
    local seen = {}
    ensure_installed = vim.tbl_filter(function(name)
      if not seen[name] then
        seen[name] = true
        return true
      end
      return false
    end, ensure_installed)

    -- trace { 'ensure_installed', ensure_installed }
    require('mason-lspconfig').setup {
      ensure_installed = opts.ensure_installed,
      automatic_enable = false,
      handlers = { setup_server },
    }
  end,
}
