local debug = my.log.debug
local trace = my.log.trace
return {

  -- register menu group
  require('lib.tools').register_keymap_groups {
    [ [[<leader>al]] ] = { name = 'Lspconfig' },
  },

  -------------------------------------------------------------------------------
  -- lspconfig
  -------------------------------------------------------------------------------
  {
    'neovim/nvim-lspconfig', -- https://github.com/neovim/nvim-lspconfig
    dependencies = {
      'b0o/schemastore.nvim', -- https://github.com/b0o/schemastore.nvim
      -- `config=true` ensures it's setup before lspconfig
      { 'folke/neodev.nvim', config = true }, -- https://github.com/folke/neodev.nvim
      -- `config=true` ensures it's setup before lspconfig
      { 'folke/neoconf.nvim', cmd = 'Neoconf', config = true }, -- https://github.com/folke/neoconf.nvim

      'williamboman/mason-lspconfig.nvim', -- https://github.com/williamboman/mason-lspconfig.nvim

      -- Simple progress widget for LSP
      { 'j-hui/fidget.nvim', branch = 'legacy', opts = {} }, -- https://github.com/j-hui/fidget.nvim
    },
    event = { 'BufReadPre', 'BufNewFile' },
    cmd = { 'LspInfo', 'LspLog', 'LspStart', 'LspStop', 'LspRestart', 'LspInstall', 'LspUninstall' },

    keys = {
      { [[<leader>Sl]], vim.cmd.LspInfo, desc = 'LSP Info' },

      { [[<leader>ali]], vim.cmd.LspInfo, desc = 'LSP Info' },
      { [[<leader>all]], vim.cmd.LspLog, desc = 'LSP Log' },
      { [[<leader>als]], vim.cmd.LspStart, desc = 'LSP Start' },
      { [[<leader>alS]], vim.cmd.LspStop, desc = 'LSP Stop' },
      { [[<leader>alr]], vim.cmd.LspRestart, desc = 'LSP Restart' },
    },

    opts = {
      ensure_installed = { 'tsserver', 'pyright' },

      -- default LSP capabilities
      capabilities = {},

      -- Lspconfig Server Settings
      ---@type table<string, lspconfig.options>
      servers = {
        -- e.g.
        -- lua_ls = {
        --  ...
        -- }
      },

      ---@type table<string, fun(name:string, config: lspconfig.options)>
      setup = {
        -- -- example to setup with typescript.nvim
        -- foobar = function(_, config)
        --    ...
        -- end,
        -- -- default setup
        -- ["*"] = function(name, config)
        --   require('lspconfig').foobar.setup(config)
        -- end,
      },
    },

    config = function(_, opts)
      -- for some reason lspconfig popups do not have a border
      require('lspconfig.ui.windows').default_options.border = 'single'

      local default_capabilities = vim.tbl_deep_extend(
        'force',
        {},
        vim.lsp.protocol.make_client_capabilities(),
        -- FIXME: uncomment once we have cmp setup
        -- require('cmp_nvim_lsp').default_capabilities(),
        opts.capabilities or {}
      )
      local defaults = { capabilities = default_capabilities }

      local servers = opts.servers
      -- this handler is called by mason-lspconfig when mason installs a server
      -- default handler will just setup server with lspconfig
      -- can owerride via opts.setup[name] or opts.setup['*']
      -- handler is called with defaults merged with opts.servers[name]
      local function default_setup_handler(name, config)
        trace { 'lspconfig', name, vim.tbl_keys(config) }
        require('lspconfig')[name].setup(config)
      end
      local function setup_server(name)
        trace { 'setup_server', name }
        local setup_handler = opts.setup and (opts.setup[name] or opts.setup['*']) or default_setup_handler
        local config = vim.tbl_deep_extend('force', vim.deepcopy(defaults), servers[name] or {})
        trace { 'setup_handler', name, vim.tbl_keys(config) }
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
      end, ensure_installed)

      trace { 'ensure_installed', ensure_installed }
      require('mason-lspconfig').setup { ensure_installed = opts.ensure_installed, handlers = { setup_server } }
    end,
  },
}
