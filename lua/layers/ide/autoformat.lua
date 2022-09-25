-- lua/layers/ide/autoformat.lua

return {
  {
    'jose-elias-alvarez/null-ls.nvim', -- https://github.com/jose-elias-alvarez/null-ls.nvim
    -- disable = true,

    config = function()
      require('null-ls').setup {
        -- debug = true,
        sources = {
          require('null-ls').builtins.formatting.prettier,

          require('null-ls').builtins.formatting.stylua,
          require('null-ls').builtins.formatting.rubocop,

          require('null-ls').builtins.formatting.shfmt,

          require('null-ls').builtins.diagnostics.rubocop,

          require('null-ls').builtins.diagnostics.shellcheck,

          -- require('null-ls').builtins.completion.spell,
          -- require('null-ls').builtins.formatting.trim_whitespace,
        },
      }

      require('my.tools.format').setup {}
    end,
  },

  {
    'jayp0521/mason-null-ls.nvim', -- https://github.com/jayp0521/mason-null-ls.nvim

    config = function()
      require('mason-null-ls').setup {
        ensure_installed = { 'stylua', 'jq', 'shfmt', 'shellcheck' },
      }
    end,
  },

  {
    'lukas-reineke/lsp-format.nvim', -- https://github.com/lukas-reineke/lsp-format.nvim
    disable = true,

    config = function()
      require('lsp-format').setup {
        lua = {
          -- exclude = { 'sumneko_lua' }, -- using stylua via null-ls
        },
        typescript = {
          -- exclude = { 'null-ls' },
        },
      }
      require('my.tools').on_lsp_attach('null_attach', function(client, _)
        require('lsp-format').on_attach(client)
      end)

      local function format_toggle()
        vim.cmd [[FormatToggle]]
      end

      local function format_toggle_filetype()
        local buf_ft = vim.api.nvim_buf_get_option(0, 'filetype')
        vim.cmd('FormatToggle ' .. buf_ft)
      end

      require('which-key').register {
        ['\\'] = {
          a = {
            name = 'AutoFormat',
            f = { format_toggle_filetype, 'Filetype' },
            a = { format_toggle, 'Autoformat' },
          },
        },
      }
    end,
  },
}

-- TODO: clean
-- config ----------------------------------------------------------------------
-- require('format').setup {
--   vim = {
--     {
--       cmd = { 'stylua' },
--       start_pattern = '^lua << LUA$',
--       end_pattern = '^LUA$',
--     },
--   },

--   lua = {
--     {
--       cmd = { 'stylua --search-parent-directories' },
--     },
--   },

--   json = {
--     { cmd = { 'npx prettier --write' } },
--   },

--   javascript = {
--     { cmd = { 'npx prettier --write' } },
--   },

--   typescript = {
--     { cmd = { 'npx prettier --write' } },
--   },
-- }
