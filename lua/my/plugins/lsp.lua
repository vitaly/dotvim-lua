return function (use)
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

      config = function ()

        local vimp = require('vimp')
        local noremap = vimp.noremap
        noremap('<plug>Goto(declaration)',     '<cmd>lua vim.lsp.buf.declaration()<cr>')
        noremap('<plug>Goto(definitions)',     '<cmd>lua require("telescope.builtin").lsp_definitions()<cr>')
        noremap('<plug>Hover()',               '<cmd>lua vim.lsp.buf.hover()<CR>')
        noremap('<plug>Goto(implementations)', '<cmd>lua require("telescope.builtin").lsp_implementations()<CR>')
        noremap('<plug>Help(signature)',       '<cmd>lua vim.lsp.buf.signature_help()<CR>')
        noremap('<plug>Goto(type)',            '<cmd>lua vim.lsp.buf.type_definition()<CR>')

        -- noremap('<plug>Refactor(rename)',      '<cmd>lua vim.lsp.buf.rename()<CR>')
        noremap('<plug>Refactor(rename)',      '<cmd>lua require("lspsaga.rename").rename()<CR>')

        noremap('<plug>Goto(references)',      '<cmd>lua require("telescope.builtin").lsp_references()<CR>')
        noremap('<plug>Code(actions)',         '<cmd>lua require("telescope.builtin").lsp_code_actions()<CR>')
        noremap('<plug>Goto(first)',           '<cmd>normal gg<cr><cmd>lua vim.lsp.diagnostic.goto_next()<cr>')
        noremap('<plug>Goto(next)',            '<cmd>lua vim.lsp.diagnostic.goto_next()<cr>')
        noremap('<plug>Goto(previous)',        '<cmd>lua vim.lsp.diagnostic.goto_prev()<cr>')





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





        local lspconfig = require('lspconfig')






        vim.lsp.handlers['textDocument/publishDiagnostics'] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
            virtual_text = false,
            signs = true,
            update_in_insert = false,
            underline = true,
          })







        local on_attach = function(client, bufnr)
          local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end
          -- local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end

          -- Enable completion triggered by <c-x><c-o>
          buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')


          require "lsp_signature".on_attach()


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

          local vimp = require('vimp')
          local nmap = vimp.nmap
          local buffer = { 'silent', 'buffer' }
          nmap(buffer, '<localleader>gd', '<plug>Goto(definitions)')
          nmap(buffer, '<localleader>gD', '<plug>Goto(declaration)')
          nmap(buffer, '<localleader>gr', '<plug>Goto(references)')
          nmap(buffer, '<localleader>gT', '<plug>Goto(type)')
          nmap(buffer, '<localleader>rr', '<plug>Refactor(rename)')
          nmap(buffer, '<localleader>a', '<plug>Code(actions)')
          nmap(buffer, 'K',               '<plug>Hover()')
          nmap(buffer, '<localleader>1', '<plug>Goto(first)')
          nmap(buffer, '<localleader>n', '<plug>Goto(next)')
          nmap(buffer, '<localleader>p', '<plug>Goto(previous)')

        end

        local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
        local opts = {
          on_attach = on_attach,
          capabilities = capabilities,
          flags = {
            debounce_text_changes = 150,
          }
        }

        -- local servers = { 'clangd', 'rust_analyzer', 'pyright', 'tsserver' }
        -- for _, server in ipairs(servers) do
        --   lspconfig[server].setup(opts)
        -- end

        -- Register a handler that will be called for all installed servers.
        -- Alternatively, you may also register handlers on specific server instances instead (see example below).
        require("nvim-lsp-installer").on_server_ready(function(server)

          -- (optional) Customize the options passed to the server
          -- if server.name == "tsserver" then
          --     opts.root_dir = function() ... end
          -- end

          -- This setup() function is exactly the same as lspconfig's setup function.
          -- Refer to https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
          server:setup(opts)
        end)

        -- print "lsp-config loaded"
      end,
    },

    -- 'nvim-lua/lsp-status.nvim', -- https://github.com/nvim-lua/lsp-status.nvim

    {
      "folke/trouble.nvim", -- https://github.com/folke/trouble.nvim
      requires = "kyazdani42/nvim-web-devicons",
      config = function()
        require("trouble").setup {
        }
      end,
    },



    {
      'ray-x/lsp_signature.nvim', -- https://github.com/ray-x/lsp_signature.nvim
      config = function ()
        require('lsp_signature').setup {
          bind = true,
          hint_enable = false,
          handler_opts = {
            border = "rounded"
          },
        }
      end
    },

    {
      'kosayoda/nvim-lightbulb', -- https://github.com/kosayoda/nvim-lightbulb
      config = function ()
        vim.cmd [[autocmd CursorHold,CursorHoldI * lua require'nvim-lightbulb'.update_lightbulb()]]
      end
    },
  }

end
