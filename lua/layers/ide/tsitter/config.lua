return {
  setup = function()
    --------------------------------------------------------------------------
    -- SETUP
    require('nvim-treesitter.configs').setup {
      ensure_installed = { 'c', 'comment', 'css', 'elixir', 'go', 'html', 'javascript', 'jsdoc', 'lua', 'query', 'ruby', 'scss', 'toml', 'typescript', 'vim', 'yaml' },

      -- 'bash', 'cpp', 'python', 'rust', 'scala',
      -- -- brew install gcc
      -- -- CC=gcc-11 vim -c "TSInstall norg"
      -- 'norg', 'norg_metqa', 'norg_table',

      highlight = { enable = true },
      context_commentstring = { enable = true },

      --   TODO: review
      playground = {
        enable = true,
        disable = {},
        updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code
        persist_queries = false, -- Whether the query persists across vim sessions
      },
    }

    --------------------------------------------------------------------------
    -- KEYMAPS
    nnoremap('<leader>atI', ':<C-U>TSInstall ', 'Install...')
    nnoremap('<leader>atU', ':<C-U>TSUpdate ', 'Update ...')
    require('which-key').register({

      ['<leader>at'] = {
        name = 'Tree Sitter',

        i = { '<cmd>TSInstallInfo<cr>', 'Install Info' },
        m = { '<cmd>TSModuleInfo<cr>', 'Module Info' },
        c = { '<cmd>TSConfigInfo<cr>', 'Config Info' },
      },

      ['\\'] = {
        p = { '<cmd>TSPlaygroundToggle<cr>', 'Playground' },
      },

    }, { silent = true })
  end
}

-- TODO: review
-- -- PARSERS ---------------------------------------------------------------------
-- local parser_configs = require('nvim-treesitter.parsers').get_parser_configs()

-- parser_configs.norg = {
--   install_info = {
--     url = 'https://github.com/nvim-neorg/tree-sitter-norg',
--     files = { 'src/parser.c', 'src/scanner.cc' },
--     branch = 'main',
--   },
-- }

-- parser_configs.norg_meta = {
--   install_info = {
--     url = 'https://github.com/nvim-neorg/tree-sitter-norg-meta',
--     files = { 'src/parser.c' },
--     branch = 'main',
--   },
-- }

-- parser_configs.norg_table = {
--   install_info = {
--     url = 'https://github.com/nvim-neorg/tree-sitter-norg-table',
--     files = { 'src/parser.c' },
--     branch = 'main',
--   },
-- }

-- -- TREESITTER config -----------------------------------------------------------
-- require('nvim-treesitter.configs').setup {


--   context_commentstring = { enable = true },
--   rainbow = { enable = true },
--   autopairs = { enable = true },

--   incremental_selection = {
--     enable = true,
--     keymaps = {
--       init_selection = 'gnn',
--       node_incremental = 'grn',
--       scope_incremental = 'grc',
--       node_decremental = 'grm',
--     },
--   },

--   -- refactor = {
--   --   smart_rename = { enable = false, keymaps = { smart_rename = 'grr' } },
--   --   highlight_definitions = { enable = false },
--   --   highlight_current_scope = { enable = false }
--   -- },

--   textobjects = {
--     select = {
--       enable = true,
--       keymaps = {

--         -- or you use the queries from supported languages with textobjects.scm
--         ['af'] = '@function.outer',
--         ['if'] = '@function.inner',

--         ['aC'] = '@class.outer',
--         ['iC'] = '@class.inner',

--         ['ac'] = '@conditional.outer',
--         ['ic'] = '@conditional.inner',

--         ['ae'] = '@block.outer',
--         ['ie'] = '@block.inner',

--         ['al'] = '@loop.outer',
--         ['il'] = '@loop.inner',

--         ['as'] = '@statement.outer',
--         ['is'] = '@statement.inner',

--         ['ad'] = '@comment.outer',

--         ['am'] = '@call.outer',
--         ['im'] = '@call.inner',
--       },
--     },

--     move = {
--       enable = true,
--       set_jumps = true, -- whether to set jumps in the jumplist
--       goto_next_start = {
--         [']m'] = '@function.outer',
--         [']]'] = '@class.outer',
--       },
--       goto_next_end = {
--         [']M'] = '@function.outer',
--         [']['] = '@class.outer',
--       },
--       goto_previous_start = {
--         ['[m'] = '@function.outer',
--         ['[['] = '@class.outer',
--       },
--       goto_previous_end = {
--         ['[M'] = '@function.outer',
--         ['[]'] = '@class.outer',
--       },
--     },
--   },

-- }

-- -- KEYMAPS ---------------------------------------------------------------------

-- require('which-key').register({
--   i = {
--     f = 'function',
--     c = 'conditional',
--     C = 'class',
--     e = 'block',
--     m = 'method call',
--     l = 'loop',
--   },
-- }, { mode = 'o' })
