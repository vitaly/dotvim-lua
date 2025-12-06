-- local debug = my.log.debug
-- local trace = my.log.trace

local au = require('lib.au')
local glue = require('glue').register('lsp')
local wk = require('which-key')

local lsp_config = {
  -- can use mason names, or lspconfig names, or null-ls names
  ensure_installed = {
    'jq',
    'stylua',
    'tree-sitter-cli',
  },

  ---@type table<string, vim.lsp.Config | { mason: boolean}>
  servers = {
    lua_ls = {},
    ts_ls = {},
    jsonls = {},
    yamlls = {},
    bashls = {},
    dockerls = {},
    ruby_lsp = { cmd = { 'ruby-lsp' } },
  },
}

local function define_lsp_global_maps()
  require('plugins.lsp.actions').start()
  wk.add({
    { [[<leader>al]], group = 'LSP' },

    { [[<leader>ali]], function() glue.emit('lsp.actions.lsp_info') end, desc = 'Info' },
    { [[<leader>all]], function() glue.emit('lsp.actions.lsp_log') end, desc = 'Log' },
    { [[<leader>als]], function() glue.emit('lsp.actions.lsp_start') end, desc = 'Start' },
    { [[<leader>alS]], function() glue.emit('lsp.actions.lsp_stop') end, desc = 'Stop' },
    { [[<leader>alr]], function() glue.emit('lsp.actions.lsp_restart') end, desc = 'Restart' },
    { [[<leader>alw]], function() glue.emit('lsp.actions.lsp_workspace_folders') end, desc = 'Workspace Folders' },
  })
end

local function define_lsp_buffer_maps(client, buf)
  if client and client:supports_method(vim.lsp.protocol.Methods.textDocument_inlayHint, buf) then
    wk.add({
      [[\h]],
      function() vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ bufnr = buf })) end,
      buffer = buf,
      desc = 'Toggle Inlay Hints',
    })
  end

  wk.add({
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
end

return {

  -------------------------------------------------------------------------------
  -- mason
  -------------------------------------------------------------------------------
  {
    'williamboman/mason.nvim', -- https://github.com/williamboman/mason.nvim
    lazy = true,
    build = ':MasonUpdate', -- :MasonUpdate updates registry contents
    cmd = { 'Mason', 'MasonLog', 'MasonUpdate', 'MasonInstall', 'MasonUninstall', 'MasonUninstallAll' },
    init = function() wk.add({ [[<leader>am]], group = 'Mason' }) end,

    keys = {
      { [[<leader>amm]], vim.cmd.Mason, desc = 'Mason' },
      { [[<leader>aml]], vim.cmd.MasonLog, desc = 'Mason Log' },
      { [[<leader>amu]], vim.cmd.MasonUpdate, desc = 'Mason Update' },
      { [[<leader>ami]], [[:<c-u>MasonInstall ]], desc = 'Mason Install...' },
    },

    config = true,
  },

  -------------------------------------------------------------------------------
  -- lspconfig
  -------------------------------------------------------------------------------
  {
    'neovim/nvim-lspconfig', -- https://github.com/neovim/nvim-lspconfig

    dependencies = {
      'mason-org/mason.nvim', -- https://github.com/mason-org/mason.nvim
      { 'mason-org/mason-lspconfig.nvim', opts = { ensure_installed = {}, automatic_enable = false } }, -- https://github.com/mason-org/mason-lspconfig.nvim
      'WhoIsSethDaniel/mason-tool-installer.nvim',
      'b0o/schemastore.nvim', -- https://github.com/b0o/schemastore.nvim
      -- Simple progress widget for LSP
      { 'j-hui/fidget.nvim', opts = {} }, -- https://github.com/j-hui/fidget.nvim
      { 'kosayoda/nvim-lightbulb' }, -- https://github.com/kosayoda/nvim-lightbulb
    },

    config = function()
      -- configure tools installer
      local ensure_installed = vim.deepcopy(lsp_config.ensure_installed or {})
      for server, config in pairs(lsp_config.servers) do
        if config.mason ~= false then table.insert(ensure_installed, server) end
      end
      require('mason-tool-installer').setup({
        ensure_installed = ensure_installed,
        auto_update = false,
        run_on_start = true,
      })

      -- configure servers
      for server, config in pairs(lsp_config.servers) do
        config.capabilities = require('cmp_nvim_lsp').default_capabilities(config.capabilities or {})
        vim.lsp.config(server, config)
        vim.lsp.enable(server)
      end

      vim.diagnostic.config({ virtual_lines = { current_line = true } })

      -- configure lightbulb
      require('nvim-lightbulb').setup({
        code_lenses = true,
        float = { enabled = false },
        autocmd = { enabled = true },
        sign = { enabled = false },
        virtual_text = { enabled = true },
      })

      define_lsp_global_maps()

      au.lsp_on_attach('lsp.init', function(client, buf) define_lsp_buffer_maps(client, buf) end)
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
