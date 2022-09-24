return {
  --------------------------------------------------------------------------
  -- LSP Config
  {
    'neovim/nvim-lspconfig', -- https://github.com/neovim/nvim-lspconfig

    config = function()
      require 'layers.ide.lsp.maps'

      require('layers.ide.lsp.style').setup()

      require('my.tools').on_lsp_attach('lsp_attach', require 'layers.ide.lsp.on_attach')
    end,
  },

  --------------------------------------------------------------------------
  -- MASON - Installer for nvim
  {
    'williamboman/mason.nvim', -- https://github.com/williamboman/mason.nvim

    -- can't lazy load becase mason-lspconfig.nvim is using it
    -- cmd = { 'Mason', 'MasonLog' },

    config = function()
      require('mason').setup()

      require('which-key').register {
        ['<leader>am'] = {
          name = 'Mason',

          m = { '<cmd>Mason<cr>', 'Mason' },
          l = { '<cmd>MasonLog<cr>', 'Log' },
        },
      }
    end,
  },

  --------------------------------------------------------------------------
  -- LSP Install
  {
    'williamboman/mason-lspconfig.nvim', -- https://github.com/williamboman/mason-lspconfig.nvim

    config = function()
      require('mason-lspconfig').setup {
        ensure_installed = { 'sumneko_lua' },
      }

      local lspconfig = require 'lspconfig'

      require('mason-lspconfig').setup_handlers {
        function(server_name) -- default handler (optional)
          lspconfig[server_name].setup {
            capabilities = require('layers.ide.cmp.config').capabilities(),
          }
        end,

        --------------------------------------------------------------------
        -- SUMNEKO_LUA
        ['sumneko_lua'] = function()
          lspconfig.sumneko_lua.setup {
            capabilities = require('layers.ide.cmp.config').capabilities(),

            settings = {
              Lua = {
                runtime = { version = 'LuaJIT' },

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
                  -- library = vim.api.nvim_get_runtime_file("", true),
                  library = {
                    [vim.fn.expand '$VIMRUNTIME/lua'] = true,
                    [vim.fn.expand '$VIMRUNTIME/lua/vim/lsp'] = true,
                  },
                },

                telemetry = { enable = false },
              },
            },
          }
        end, -- sumneko_lua
      }
    end,
  },

  --------------------------------------------------------------------------
  -- Simple progress widget for LSP
  {
    'j-hui/fidget.nvim', -- https://github.com/j-hui/fidget.nvim

    config = function()
      require('fidget').setup {}
    end,
  },

  --------------------------------------------------------------------------
  -- LSP Trauble
  {
    'folke/trouble.nvim', -- https://github.com/folke/trouble.nvim
    requires = 'kyazdani42/nvim-web-devicons',
    config = function()
      require('layers.ide.lsp.trouble').setup()
    end,
  },

  --------------------------------------------------------------------------
  -- COLORS
  -- add missing theme highlights
  {
    'folke/lsp-colors.nvim', -- https://github.com/folke/lsp-colors.nvim
    config = function()
      require('lsp-colors').setup()
    end,
  },

  --------------------------------------------------------------------------
  -- SIGNATURE
  {
    'ray-x/lsp_signature.nvim', -- https://github.com/ray-x/lsp_signature.nvim
    config = function()
      require('lsp_signature').setup {
        bind = true,
        floating_window = true,
        hint_enable = true,
        hint_prefix = 'ℹ️',
        handler_opts = {
          border = 'rounded',
        },
      }

      require('my.tools').on_lsp_attach('lsp_signature', function()
        require('lsp_signature').on_attach()
      end)
    end,
  },

  --------------------------------------------------------------------------
  -- FOLDING
  -- { 'vitaly/folding-nvim' },
  {
    'pierreglaser/folding-nvim', -- https://github.com/pierreglaser/folding-nvim
    branch = 'nvim-nightly',

    config = function()
      require('my.tools').on_lsp_attach('lsp_folding', require('folding').on_attach)
    end,
  },

  --------------------------------------------------------------------------
  -- LSP Dressing (ui improvements)
  -- { 'stevearc/dressing.nvim' }, -- https://github.com/stevearc/dressing.nvim
}

-- DEFAULT SIGNATURE CONFIG
-- {
--   debug = false, -- set to true to enable debug logging
--   log_path = vim.fn.stdpath("cache") .. "/lsp_signature.log", -- log dir when debug is on
--   -- default is  ~/.cache/nvim/lsp_signature.log
--   verbose = false, -- show debug line number

--   bind = true, -- This is mandatory, otherwise border config won't get registered.
--                -- If you want to hook lspsaga or other signature handler, pls set to false
--   doc_lines = 10, -- will show two lines of comment/doc(if there are more than two lines in doc, will be truncated);
--                  -- set to 0 if you DO NOT want any API comments be shown
--                  -- This setting only take effect in insert mode, it does not affect signature help in normal
--                  -- mode, 10 by default

--   max_height = 12, -- max height of signature floating_window
--   max_width = 80, -- max_width of signature floating_window
--   wrap = true, -- allow doc/signature text wrap inside floating_window, useful if your lsp return doc/sig is too long

--   floating_window = true, -- show hint in a floating window, set to false for virtual text only mode

--   floating_window_above_cur_line = true, -- try to place the floating above the current line when possible Note:
--   -- will set to true when fully tested, set to false will use whichever side has more space
--   -- this setting will be helpful if you do not want the PUM and floating win overlap

--   floating_window_off_x = 1, -- adjust float windows x position.
--   floating_window_off_y = 0, -- adjust float windows y position. e.g -2 move window up 2 lines; 2 move down 2 lines

--   close_timeout = 4000, -- close floating window after ms when laster parameter is entered
--   fix_pos = false,  -- set to true, the floating window will not auto-close until finish all parameters
--   hint_enable = true, -- virtual hint enable
--   hint_prefix = "🐼 ",  -- Panda for parameter, NOTE: for the terminal not support emoji, might crash
--   hint_scheme = "String",
--   hi_parameter = "LspSignatureActiveParameter", -- how your parameter will be highlight
--   handler_opts = {
--     border = "rounded"   -- double, rounded, single, shadow, none
--   },

--   always_trigger = false, -- sometime show signature on new line or in middle of parameter can be confusing, set it to false for #58

--   auto_close_after = nil, -- autoclose signature float win after x sec, disabled if nil.
--   extra_trigger_chars = {}, -- Array of extra characters that will trigger signature completion, e.g., {"(", ","}
--   zindex = 200, -- by default it will be on top of all floating windows, set to <= 50 send it to bottom

--   padding = '', -- character to pad on left and right of signature can be ' ', or '|'  etc

--   transparency = nil, -- disabled by default, allow floating win transparent value 1~100
--   shadow_blend = 36, -- if you using shadow as border use this set the opacity
--   shadow_guibg = 'Black', -- if you using shadow as border use this set the color e.g. 'Green' or '#121315'
--   timer_interval = 200, -- default timer check interval set to lower value if you want to reduce latency
--   toggle_key = nil, -- toggle signature on and off in insert mode,  e.g. toggle_key = '<M-x>'

--   select_signature_key = nil, -- cycle to next signature, e.g. '<M-n>' function overloading
--   move_cursor_key = nil, -- imap, use nvim_set_current_win to move cursor between current win and floating
-- }
