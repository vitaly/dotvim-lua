-- local debug = my.log.debug
-- local trace = my.log.trace

local au = require('lib.au')
local glue = require('glue').register('lsp')

return {

  -------------------------------------------------------------------------------
  -- mason
  -------------------------------------------------------------------------------
  {
    'williamboman/mason.nvim', -- https://github.com/williamboman/mason.nvim
    lazy = true,
    build = ':MasonUpdate', -- :MasonUpdate updates registry contents
    cmd = { 'Mason', 'MasonLog', 'MasonUpdate', 'MasonInstall', 'MasonUninstall', 'MasonUninstallAll' },
    init = function() require('which-key').add({ [[<leader>am]], group = 'Mason' }) end,

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
      ensure_installed = { 'lua_ls', 'ts_ls', 'jsonls', 'yamlls', 'bashls', 'dockerls', 'ruby_lsp', 'stylua' },

      automatic_enable = false,
    },
  },

  -------------------------------------------------------------------------------
  -- misc lsp related plugins
  -------------------------------------------------------------------------------
  -- Simple progress widget for LSP
  { 'j-hui/fidget.nvim', opts = {} }, -- https://github.com/j-hui/fidget.nvim

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

    config = function()
      require('which-key').add({
        { [[<leader>al]], group = 'LSP' },

        { [[<leader>ali]], function() glue.emit('lsp.actions.lsp_info') end, desc = 'Info' },
        { [[<leader>all]], function() glue.emit('lsp.actions.lsp_log') end, desc = 'Log' },
        { [[<leader>als]], function() glue.emit('lsp.actions.lsp_start') end, desc = 'Start' },
        { [[<leader>alS]], function() glue.emit('lsp.actions.lsp_stop') end, desc = 'Stop' },
        { [[<leader>alr]], function() glue.emit('lsp.actions.lsp_restart') end, desc = 'Restart' },
        { [[<leader>alw]], function() glue.emit('lsp.actions.lsp_workspace_folders') end, desc = 'Workspace Folders' },
      })

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

      require('plugins.lsp.actions').start()

      au.lsp_on_attach('lsp.init', function(_, buf)
        require('which-key').add({
          mode = 'n',
          buffer = buf,

          { 'gd', function() glue.emit('lsp.actions.definition') end, desc = 'Go to Definition' },
          { 'gD', function() glue.emit('lsp.actions.declaration') end, desc = 'Go to Declaration' },
          { 'gK', function() glue.emit('lsp.actions.signature_help') end, desc = 'Signature Help' },

          { '<localleader>g', desc = 'Go to' },
          { '<localleader>gd', function() glue.emit('telescope.lsp.actions.definition') end, desc = 'Go to Definition' },
          { '<localleader>gr', function() glue.emit('telescope.lsp.actions.references') end, desc = 'Go to References' },
          { '<localleader>gi', function() glue.emit('telescope.lsp.actions.implementation') end, desc = 'Go to Implementation' },
          { '<localleader>gt', function() glue.emit('telescope.lsp.actions.type_definition') end, desc = 'Go to Type Definition' },

          { '<localleader>s', desc = 'Search' },
          { '<localleader>sd', function() glue.emit('telescope.lsp.actions.document_symbols') end, desc = 'Document Symbols' },
          { '<localleader>sw', function() glue.emit('telescope.lsp.actions.workspace_symbols') end, desc = 'Document Symbols' },
          { '<localleader>sW', function() glue.emit('telescope.lsp.actions.dynamic_workspace_symbols') end, desc = 'Document Symbols' },

          --
          -- { '', function() glue.emit('lsp.actions.buf.add_workspace_folder') end, desc = 'Add Workspace folder' },
          -- { '', function() glue.emit('lsp.actions.buf.code_action') end, desc = 'Code Action' },
          -- { '', function() glue.emit('lsp.actions.buf.document_symbol') end, desc = 'Document Symbol' },
          -- { '', function() glue.emit('lsp.actions.buf.implementation') end, desc = 'Goto Implementation' },
          -- { '', function() glue.emit('lsp.actions.buf.incoming_calls') end, desc = 'Show Incoming Calls' },
          -- { '', function() glue.emit('lsp.actions.buf.outgoing_calls') end, desc = 'Show Outgoing Calls' },
          -- { '', function() glue.emit('lsp.actions.buf.references') end, desc = 'Show References' },
          -- { '', function() glue.emit('lsp.actions.buf.remove_workspace_folder') end, desc = 'Remove Workspace Folder' },
          -- { '', function() glue.emit('lsp.actions.buf.signature_help') end, desc = 'Signature Help' },
          -- { '', function() glue.emit('lsp.actions.buf.type_definition') end, desc = 'Type Definition' },
          -- { '', function() glue.emit('lsp.actions.buf.workspace_symbol') end, desc = 'Workspace Symbol' },
          --
        })

        if vim.lsp.buf.inlay_hint then
          require('which-key').add({
            mode = 'n',
            buffer = buf,
            { [[\i]], function() vim.lsp.buf.inlay_hint(0, nil) end, desc = 'Toggle Inlay Hints' },
          })
        end
      end)
    end,
  },
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
