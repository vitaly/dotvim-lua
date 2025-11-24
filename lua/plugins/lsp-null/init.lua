---------------------------------------------------------------------------------
-- NULL_LS
-- generic LSP server used for things like linting, formatting, etc
---------------------------------------------------------------------------------
return {
  -- 'jose-elias-alvarez/null-ls.nvim', -- https://github.com/jose-elias-alvarez/null-ls.nvim
  'nvimtools/none-ls.nvim', -- https://github.com/nvimtools/none-ls.nvim
  dependencies = {
    'jayp0521/mason-null-ls.nvim', -- https://github.com/jayp0521/mason-null-ls.nvim
  },
  event = { 'BufReadPre', 'BufNewFile' },

  init = function()
    require('lib.tools').add_keys { [[<leader>an]], group = 'Null Ls' }
  end,

  keys = {
    { [[<leader>Sn]], vim.cmd.NullLsInfo, desc = 'Null LS Info' },
    { [[<leader>ani]], vim.cmd.NullLsInfo, desc = 'Null LS Info' },
    { [[<leader>anl]], vim.cmd.NullLsLog, desc = 'Null LS Log' },
  },

  opts = function()
    local nls = require 'null-ls'
    return {
      border = 'single',
      debug = false,

      -- root_dir = require('null-ls.utils').root_pattern('.null-ls-root', '.neoconf.json', 'Makefile', '.git'),
      sources = {
        nls.builtins.formatting.prettier,
        nls.builtins.formatting.stylua,
        nls.builtins.formatting.rubocop,
        nls.builtins.formatting.shfmt,
        nls.builtins.diagnostics.rubocop,
        nls.builtins.diagnostics.shellcheck,
        -- nls.builtins.completion.spell,
        -- nls.builtins.formatting.trim_whitespace,
      },

      -- for mason-null-ls
      ensure_installed = { 'stylua', 'jq', 'shfmt', 'shellcheck' },
    }
  end,

  config = function(_, opts)
    require('null-ls').setup(opts)
    require('mason-null-ls').setup {
      ensure_installed = opts.ensure_installed,
    }
  end,
}
