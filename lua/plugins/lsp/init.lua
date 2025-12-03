-- local debug = my.log.debug
-- local trace = my.log.trace

local maps = require('plugins.lsp.maps')
local tools = require('lib.tools')
-- local au = require 'lib.au'
--
return {

  -------------------------------------------------------------------------------
  -- lspconfig
  -------------------------------------------------------------------------------
  {
    'neovim/nvim-lspconfig', -- https://github.com/neovim/nvim-lspconfig

    event = 'LazyFile',
    cmd = { 'LspInfo', 'LspLog', 'LspStart', 'LspStop', 'LspRestart', 'LspInstall', 'LspUninstall' },

    dependencies = {
      'mason-org/mason.nvim', -- https://github.com/mason-org/mason.nvim
      'mason-org/mason-lspconfig.nvim', -- https://github.com/mason-org/mason-lspconfig.nvim
      'b0o/schemastore.nvim', -- https://github.com/b0o/schemastore.nvim

      -- 'saghen/blink.cmp',
    },

    init = function()
      require('which-key').add({ [[<leader>al]], group = 'LSP' })
    end,

    keys = {
      tools.map_keys('<leader>Sl', maps.lsp_info),

      tools.map_keys('<leader>alh', maps.lsp_health),
      tools.map_keys('<leader>ali', maps.lsp_info),
      tools.map_keys('<leader>all', maps.lsp_log),
      tools.map_keys('<leader>als', maps.lsp_start),
      tools.map_keys('<leader>alS', maps.lsp_stop),
      tools.map_keys('<leader>alr', maps.lsp_restart),
      tools.map_keys('<leader>alw', maps.list_workspace_folders),
    },

    config = function()
      -- TODO: move to config
      ---@type { [string]: vim.lsp.Config }
      local servers = {
        lua_ls = {},
        ts_ls = {},
        jsonls = {},
        yamlls = {},
        bashls = {},
        dockerls = {},
        ruby_lsp = { cmd = { 'ruby-lsp' } },
      }

      for server, config in pairs(servers) do
        -- config.capabilities = require('blink.cmp').get_lsp_capabilities(config.capabilities)
        vim.lsp.config(server, config)
        vim.lsp.enable(server)
      end

      -- vim.api.nvim_create_autocmd('LspAttach', {
      --   callback = function(ev)
      --     local client = vim.lsp.get_client_by_id(ev.data.client_id)
      --     if client and client:supports_method('textDocument/completion') then
      --       vim.lsp.completion.enable(true, client.id, ev.buf, { autotrigger = true })
      --     end
      --   end,
      -- })
      -- vim.cmd('set completeopt+=noselect')

      vim.diagnostic.config({ virtual_lines = { current_line = true } })
    end,
  },

  -------------------------------------------------------------------------------
  -- mason
  -------------------------------------------------------------------------------
  {
    'williamboman/mason.nvim', -- https://github.com/williamboman/mason.nvim
    lazy = true,
    build = ':MasonUpdate', -- :MasonUpdate updates registry contents
    cmd = { 'Mason', 'MasonLog', 'MasonUpdate', 'MasonInstall', 'MasonUninstall', 'MasonUninstallAll' },
    init = function()
      require('which-key').add({ [[<leader>am]], group = 'Mason' })
    end,

    keys = {
      { [[<leader>Sm]], vim.cmd.Mason, desc = 'Mason' }, -- Status

      { [[<leader>amm]], vim.cmd.Mason, desc = 'Mason' },
      { [[<leader>aml]], vim.cmd.MasonLog, desc = 'Mason Log' },
      { [[<leader>amu]], vim.cmd.MasonUpdate, desc = 'Mason Update' },
      { [[<leader>ami]], [[:<c-u>MasonInstall ]], desc = 'Mason Install...' },
    },

    config = true,
  },

  -------------------------------------------------------------------------------
  -- mason tool installer
  -------------------------------------------------------------------------------
  {
    'WhoIsSethDaniel/mason-tool-installer.nvim',
    config = function()
      require('mason-tool-installer').setup({
        ensure_installed = {
          'bash-language-server',
          'tree-sitter-cli',
        },
        auto_update = false,
        run_on_start = true,
      })
    end,
  },

  -------------------------------------------------------------------------------
  -- mason lspconfig
  -------------------------------------------------------------------------------
  {
    'mason-org/mason-lspconfig.nvim', -- https://github.com/mason-org/mason-lspconfig.nvim

    dependencies = {
      'mason-org/mason.nvim',
      'neovim/nvim-lspconfig',
    },

    opts = {
      ensure_installed = {
        'lua_ls',
        'ts_ls',
        'jsonls',
        'yamlls',
        'bashls',
        'dockerls',
        'ruby_lsp',
        'stylua',
      },

      automatic_enable = false,
    },
  },

  -------------------------------------------------------------------------------
  -- misc lsp related plugins
  -------------------------------------------------------------------------------
  -- Simple progress widget for LSP
  { 'j-hui/fidget.nvim', opts = {} }, -- https://github.com/j-hui/fidget.nvim
}

--
-- -- local lib_plugins = (my.config.lua or {}).add_plugins_to_workspace or {}
--
-- -- if true ~= lib_plugins then
-- --   table.insert(lib_plugins, 'nvim-dap-ui') -- TODO: configure this from within debugger layer
-- -- end
--
-- return {
--   -------------------------------------------------------------------------------
--   -- lspconfig
--   -------------------------------------------------------------------------------
--   {
--     'neovim/nvim-lspconfig', -- https://github.com/neovim/nvim-lspconfig
--
--     dependencies = {
--
--       -- -- lua dev extra setup
--       -- {
--       --   'folke/neodev.nvim', -- https://github.com/folke/neodev.nvim
--       --   opts = {
--       --     -- control adding plugins in my.copnfig.lua
--       --     library = { plugins = lib_plugins },
--       --   },
--       -- },
--
--       -- `config=true` ensures it's setup before lspconfig
--       { 'folke/neoconf.nvim', cmd = 'Neoconf', config = true }, -- https://github.com/folke/neoconf.nvim
--
--
--
--       'hrsh7th/cmp-nvim-lsp',
--
--       -- lightbulb in signcolumn whenever code action is available
--       'kosayoda/nvim-lightbulb', -- https://github.com/kosayoda/nvim-lightbulb
--     },
--
--
--     opts = {
--       -- default LSP capabilities
--       capabilities = {},
--
--       -- Enable this to enable the builtin LSP inlay hints on Neovim >= 0.10.0
--       -- Be aware that you also will need to properly configure your LSP server to
--       -- provide the inlay hints.
--       inlay_hints = {
--         enabled = false,
--       },
--
--       ensure_installed = { 'ts_ls', 'pyright' },
--
--       -- Lspconfig Server Settings
--       ---@type table<string, lspconfig.options>
--       servers = {
--         -- e.g.
--         -- lua_ls = {
--         --  ...
--         -- }
--       },
--
--       ---@type table<string, fun(name:string, config: lspconfig.options)>
--       setup = {
--         -- -- example to setup with typescript.nvim
--         -- foobar = function(_, config)
--         --    ...
--         -- end,
--         -- -- default setup
--         -- ["*"] = function(name, config)
--         --   require('lspconfig').foobar.setup(config)
--         -- end,
--       },
--     },
--
--     config = function(_, opts)
--       -- for some reason lspconfig popups do not have a border
--       require('lspconfig.ui.windows').default_options.border = 'single'
--
--       -- configure diagsnostics icons
--       local icons = my.config.icons.diagnostics
--       for type, icon in pairs(icons) do
--         local hl = 'DiagnosticSign' .. type
--         vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
--       end
--
--       -- configure inlay hints
--       if opts.inlay_hints.enabled and vim.lsp.buf.inlay_hint then
--         au.lsp_on_attach('inlay_hints', function(client, buffer)
--           if client.server_capabilities.inlayHintProvider then
--             -- debug { 'inlay_hints', client.name }
--             vim.lsp.buf.inlay_hint(buffer, true)
--           end
--         end)
--       end
--
--       -- configure lightbulb
--       require('nvim-lightbulb').setup {
--         float = { enabled = false },
--         autocmd = { enabled = true },
--         sign = { enabled = false },
--         virtual_text = {
--           enabled = true,
--           hl_mode = 'combine',
--         },
--       }
--
--       require('plugins.lsp.install').setup(opts)
--
--       au.lsp_on_attach('lsp.init', require('plugins.lsp.on_attach').on_attach)
--     end,
--   },
--
--   {
--     'ray-x/lsp_signature.nvim', -- https://github.com/ray-x/lsp_signature.nvim
--     event = { 'BufReadPre', 'BufNewFile' },
--
--     opts = {
--       bind = true,
--       floating_window = true,
--       floating_window_above_cur_line = false,
--       hint_enable = false,
--       -- hint_prefix = 'ℹ️',
--       handler_opts = {
--         border = 'rounded',
--       },
--     },
--
--     config = function()
--       au.lsp_on_attach('lsp_signature', function()
--         require('lsp_signature').on_attach()
--       end)
--     end,
--   },
-- }
