return {
  setup = function(defaults)
    local configure_server = function(server)
      local opts = vim.tbl_extend('force', defaults, {
        flags = { debounce_text_changes = 150 },
      })

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
            workspace = {
              -- Make the server aware of Neovim runtime files
              library = {
                [vim.fn.expand '$VIMRUNTIME/lua'] = true,
                [vim.fn.expand '$VIMRUNTIME/lua/vim/lsp'] = true,
              },
            },

            telemetry = { enable = false },
            -- runtime = { version = 'LuaJIT', path = vim.split(package.path, ';') },
            -- workspace = {
            --   library = {
            --     [vim.fn.expand '$VIMRUNTIME/lua'] = true,
            --     [vim.fn.expand '$VIMRUNTIME/lua/vim/lsp'] = true,
            --   },
            -- },
          },
        }
        -- elseif server.name == 'tsserver' then
        --   opts.on_attach = function(client, bufnr)
        --     client.resolved_capabilities.document_formatting = false
        --     client.resolved_capabilities.document_range_formatting = false
        --     return on_attach(client, bufnr)
        --   end
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
            logLevel = 9,
          },
        }
      elseif server.name == 'efm' then
        -- opts.cmd = { 'efm-langserver', '-logfile', '/tmp/efmlangserver.log', '-loglevel', '10' }

        opts.init_options = { documentFormatting = true }

        -- local luafmt = { formatCommand = 'luafmt -i 2 --stdin', formatStdin = true }
        local stylua = {
          formatCommand = 'stylua --search-parent-directories --stdin-filepath ${INPUT} -',
          formatStdin = true,
        }

        local prettier = { formatCommand = 'prettier --stdin-filepath ${INPUT}', formatStdin = true }

        opts.settings = {
          rootMarkers = { '.git/' },
          languages = {
            lua = { stylua },
            -- lua = { stylua, luafmt },
            -- lua = { luafmt, stylua },
            json = { prettier },
          },
        }
        opts.filetypes = { 'lua', 'json' }
        -- PRINT { server.name .. '.settings', opts.settings }
        -- PRINT { server.name .. '._default_options', server._default_options }
        -- PRINT { server.name .. '.filetypes', opts.filetypes }
      end

      -- This setup() function is exactly the same as lspconfig's setup function.
      -- Refer to https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
      server:setup(opts)
    end

    require('nvim-lsp-installer').on_server_ready(configure_server)
  end,
}
