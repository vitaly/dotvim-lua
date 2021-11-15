return function(use)
  use {

    {
      'neovim/nvim-lspconfig', -- https://github.com/neovim/nvim-lspconfig

      requires = {
        {
          'onsails/lspkind-nvim', -- https://github.com/onsails/lspkind-nvim
        },

        {
          'williamboman/nvim-lsp-installer', -- https://github.com/williamboman/nvim-lsp-installer
        },

        {
          'glepnir/lspsaga.nvim', -- https://github.com/glepnir/lspsaga.nvim
        },
      },

      config = function()
        noremap('<plug>Goto(declaration)', '<cmd>lua vim.lsp.buf.declaration()<cr>')
        noremap('<plug>Goto(definitions)', '<cmd>lua require("telescope.builtin").lsp_definitions()<cr>')
        noremap('<plug>Hover()', '<cmd>lua vim.lsp.buf.hover()<CR>')
        noremap('<plug>Goto(implementations)', '<cmd>lua require("telescope.builtin").lsp_implementations()<CR>')
        noremap('<plug>Help(signature)', '<cmd>lua vim.lsp.buf.signature_help()<CR>')
        noremap('<plug>Goto(type)', '<cmd>lua vim.lsp.buf.type_definition()<CR>')

        -- noremap('<plug>Refactor(rename)',      '<cmd>lua vim.lsp.buf.rename()<CR>')
        noremap('<plug>Refactor(rename)', '<cmd>lua require("lspsaga.rename").rename()<CR>')

        noremap('<plug>Goto(references)', '<cmd>lua require("telescope.builtin").lsp_references()<CR>')
        noremap('<plug>Code(actions)', '<cmd>lua require("telescope.builtin").lsp_code_actions()<CR>')
        noremap('<plug>Goto(first)', '<cmd>normal gg<cr><cmd>lua vim.lsp.diagnostic.goto_next()<cr>')
        noremap('<plug>Goto(next)', '<cmd>lua vim.lsp.diagnostic.goto_next()<cr>')
        noremap('<plug>Goto(previous)', '<cmd>lua vim.lsp.diagnostic.goto_prev()<cr>')

        noremap('<plug>LSP(Info)', '<cmd>LspInfo<cr>')
        noremap('<plug>LSP(Installed)', '<cmd>LspInstallInfo<cr>')
        noremap('<plug>LSP(Start)', '<cmd>LspStart<cr>')
        noremap('<plug>LSP(Stop)', '<cmd>LspStop<cr>')
        noremap('<plug>LSP(Restart)', '<cmd>LspRestart<cr>')
        noremap('<plug>LSP(Trouble)', '<cmd>LspTroubleToggle<cr>')
        noremap('<plug>LSP(Workspace-Trouble)', '<cmd>LspTroubleWorkspaceToggle<cr>')
        noremap('<plug>LSP(Refresh-Trouble)', '<cmd>LspTroubleRefresh<cr>')

        nmap('<leader>ali', '<plug>LSP(Info)')
        nmap('<leader>alI', '<plug>LSP(Installed)')
        nmap('<leader>als', '<plug>LSP(Start)')
        nmap('<leader>alS', '<plug>LSP(Stop)')
        nmap('<leader>alR', '<plug>LSP(Restart)')

        nmap('<leader>alt', '<plug>LSP(Trouble)')
        nmap('<leader>alw', '<plug>LSP(Workspace-Trouble)')
        nmap('<leader>alr', '<plug>LSP(Refresh-Trouble)')
        vim.cmd [[
          command! Autoformat     call luaeval('vim.lsp.buf.formatting()')      | retab
          command! AutoformatSync call luaeval('vim.lsp.buf.formatting_sync()') | retab
        ]]

        -- buf_keymap(0, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', keymap_opts)
        -- buf_keymap(0, 'n', 'gi', '<cmd>lua require"telescope.builtin".lsp_implementations()<CR>', keymap_opts)
        -- buf_keymap(0, 'n', 'gS', '<cmd>lua vim.lsp.buf.signature_help()<CR>', keymap_opts)
        -- buf_keymap(0, 'n', 'gTD', '<cmd>lua vim.lsp.buf.type_definition()<CR>', keymap_opts)
        -- buf_keymap(0, 'n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', keymap_opts)
        -- buf_keymap(0, 'n', 'gr', '<cmd>lua require"telescope.builtin".lsp_references()<CR>', keymap_opts)
        -- buf_keymap(0, 'n', 'gA', '<cmd>lua require"telescope.builtin".lsp_code_actions()<CR>', keymap_opts)
        -- buf_keymap(0, 'n', ']e', '<cmd>lua vim.lsp.diagnostic.goto_next()<cr>', keymap_opts)
        -- buf_keymap(0, 'n', '[e', '<cmd>lua vim.lsp.diagnostic.goto_prev()<cr>', keymap_opts)

        -- buf_set_keymap("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
        -- buf_set_keymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
        -- buf_set_keymap("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
        -- buf_set_keymap("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
        -- buf_set_keymap("n", "gk", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
        -- buf_set_keymap("n", "<space>wa", "<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>", opts)
        -- buf_set_keymap("n", "<space>wr", "<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>", opts)
        -- buf_set_keymap("n", "<space>wl", "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>", opts)
        -- buf_set_keymap("n", "<space>D", "<cmd>lua vim.lsp.buf.type_definition()<CR>", opts)
        -- buf_set_keymap("n", "<space>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
        -- buf_set_keymap("n", "<space>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
        -- buf_set_keymap("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
        -- buf_set_keymap("n", "<space>e", "<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>", opts)
        -- buf_set_keymap("n", "[d", "<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>", opts)
        -- buf_set_keymap("n", "]d", "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>", opts)
        -- buf_set_keymap("n", "<space>q", "<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>", opts)
        -- buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
        -- buf_set_keymap("v", "<space>ca", "<cmd>lua vim.lsp.buf.range_code_action()<CR>", opts)

        -- local lspkind = require('lspkind')

        local trouble = require 'trouble'
        trouble.setup()

        vim.lsp.handlers['textDocument/publishDiagnostics'] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
          virtual_text = false,
          signs = true,
          update_in_insert = false,
          underline = true,
        })

        local on_attach = function(client, bufnr)
          local function buf_set_option(...)
            vim.api.nvim_buf_set_option(bufnr, ...)
          end
          -- local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end

          -- Enable completion triggered by <c-x><c-o>
          buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

          require('lsp_signature').on_attach()

          vim.cmd [[
            hi LspReferenceText cterm=inverse gui=inverse
            hi LspReferenceRead cterm=inverse gui=inverse
            hi LspReferenceWrite cterm=inverse gui=inverse
          ]]

          if client.resolved_capabilities.document_highlight == true then
            vim.cmd [[
              augroup lsp_highlight
                au CursorHold <buffer> lua vim.lsp.buf.document_highlight()
                au CursorMoved <buffer> lua vim.lsp.buf.clear_references()
              augroup END
            ]]
          end

          vim.cmd [[
            augroup lsp_bulb
              au CursorHold,CursorHoldI <buffer> lua require"nvim-lightbulb".update_lightbulb {sign = {enabled = false}, virtual_text = {enabled = true, text = ""}, float = {enabled = false, text = "", win_opts = {winblend = 100, anchor = "NE"}}}
            augroup END
          ]]

          nmap({ 'buffer' }, 'gd', '<plug>Goto(definitions)')
          nmap({ 'buffer' }, 'gD', '<plug>Goto(declaration)')
          nmap({ 'buffer' }, 'gr', '<plug>Goto(references)')
          nmap({ 'buffer' }, 'gT', '<plug>Goto(type)')

          nmap({ 'buffer' }, '<localleader>rr', '<plug>Refactor(rename)')
          nmap({ 'buffer' }, '<localleader>a', '<plug>Code(actions)')
          nmap({ 'buffer' }, 'K', '<plug>Hover()')
          nmap({ 'buffer' }, '<localleader>1', '<plug>Goto(first)')
          nmap({ 'buffer' }, '<localleader>n', '<plug>Goto(next)')
          nmap({ 'buffer' }, '<localleader>p', '<plug>Goto(previous)')
        end

        local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

        -- local servers = { 'clangd', 'rust_analyzer', 'pyright', 'tsserver' }
        -- for _, server in ipairs(servers) do
        --   lspconfig[server].setup(opts)
        -- end

        -- Register a handler that will be called for all installed servers.
        -- Alternatively, you may also register handlers on specific server instances instead (see example below).
        require('nvim-lsp-installer').on_server_ready(function(server)
          local opts = {
            on_attach = on_attach,
            capabilities = capabilities,
            flags = {
              debounce_text_changes = 150,
            },
          }

          -- (optional) Customize the options passed to the server
          -- if server.name == "tsserver" then
          --     opts.root_dir = function() ... end
          -- end
          if server.name == 'sumneko_lua' then
            opts.settings = {
              Lua = {
                diagnostics = {
                  globals = {
                    'vim',
                    'map',
                    'noremap',
                    'nmap',
                    'nnoremap',
                    'xmap',
                    'xnoremap',
                    'cmap',
                    'cnoremap',
                    'imap',
                    'inoremap',
                  },
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
            -- opts.root_dir = function() ... end
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
      end,
    },

    {
      'jose-elias-alvarez/null-ls.nvim',

      requires = { 'nvim-lua/plenary.nvim', 'neovim/nvim-lspconfig' },

      config = function()
        require('null-ls').config {
          sources = {
            require('null-ls').builtins.formatting.prettier,
            require('null-ls').builtins.formatting.shfmt,
            require('null-ls').builtins.formatting.stylua,
            require('null-ls').builtins.formatting.trim_whitespace,
            -- require("null-ls").builtins.diagnostics.shellcheck,
            require('null-ls').builtins.completion.spell,
          },
        }

        require('lspconfig')['null-ls'].setup {
          on_attach = function(client, bufnr)
            -- vim.g.null_client = client
            -- vim.g.null_bufnr = bufnr
          end,
        }
      end,
    },

    'nvim-lua/lsp-status.nvim', -- https://github.com/nvim-lua/lsp-status.nvim

    {
      'folke/trouble.nvim', -- https://github.com/folke/trouble.nvim
      requires = 'kyazdani42/nvim-web-devicons',
      config = function()
        require('trouble').setup {}
      end,
    },

    {
      'ray-x/lsp_signature.nvim', -- https://github.com/ray-x/lsp_signature.nvim
      config = function()
        require('lsp_signature').setup {
          bind = true,
          hint_enable = false,
          handler_opts = {
            border = 'rounded',
          },
        }
      end,
    },

    {
      'kosayoda/nvim-lightbulb', -- https://github.com/kosayoda/nvim-lightbulb
      config = function()
        vim.cmd [[autocmd CursorHold,CursorHoldI * lua require'nvim-lightbulb'.update_lightbulb()]]
      end,
    },
  }
end
