-- lua/layers/ide/autoformat.lua

-- TODO: move to lsp.init
return {
  'jose-elias-alvarez/null-ls.nvim', -- https://github.com/jose-elias-alvarez/null-ls.nvim
  -- disable = true,

  requires = {
    'jayp0521/mason-null-ls.nvim', -- https://github.com/jayp0521/mason-null-ls.nvim
  },

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

    require('mason-null-ls').setup {
      ensure_installed = { 'stylua', 'jq', 'shfmt', 'shellcheck' },
    }

    require('layers.ide.format.config').setup {
      debug = false,
      settings = {

        ruby = {
          async = true,
        },

        lua = {
          cycle = {
            'null-ls',
            'sumneko_lua',
          },
        },
      },
    }
    require('layers.ide.format.maps').setup()
  end,
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
