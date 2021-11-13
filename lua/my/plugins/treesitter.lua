return function (use)
  use {
    -- https://github.com/nvim-treesitter/nvim-treesitter
    'nvim-treesitter/nvim-treesitter',
    requires = {
      -- https://github.com/nvim-treesitter/nvim-treesitter-refactor
      -- 'nvim-treesitter/nvim-treesitter-refactor',

      -- -- https://github.com/nvim-treesitter/nvim-treesitter-textobjects
      'nvim-treesitter/nvim-treesitter-textobjects',
    },
    run = ':TSUpdate',
    config = function ()
      require("nvim-treesitter.configs").setup {
        ensure_installed = 'maintained',

        highlight = { enable = true, use_languagetree = true },

        indent = { enable = true },


        incremental_selection = {
          enable = true,
          keymaps = {
            init_selection = 'gnn',
            node_incremental = 'grn',
            scope_incremental = 'grc',
            node_decremental = 'grm',
          },
        },

        -- refactor = {
        --   smart_rename = { enable = false, keymaps = { smart_rename = 'grr' } },
        --   highlight_definitions = { enable = false },
        --   highlight_current_scope = { enable = false }
        -- },


        textobjects = {
          select = {
            enable = true,
            keymaps = {

              -- or you use the queries from supported languages with textobjects.scm
              ['af'] = '@function.outer',
              ['if'] = '@function.inner',

              ['aC'] = '@class.outer',
              ['iC'] = '@class.inner',

              ['ac'] = '@conditional.outer',
              ['ic'] = '@conditional.inner',

              ['ae'] = '@block.outer',
              ['ie'] = '@block.inner',

              ['al'] = '@loop.outer',
              ['il'] = '@loop.inner',

              ['as'] = '@statement.outer',
              ['is'] = '@statement.inner',

              ['ad'] = '@comment.outer',

              ['am'] = '@call.outer',
              ['im'] = '@call.inner',
            },
          },


          move = {
            enable = true,
            set_jumps = true, -- whether to set jumps in the jumplist
            goto_next_start = {
              ["]m"] = "@function.outer",
              ["]]"] = "@class.outer",
            },
            goto_next_end = {
              ["]M"] = "@function.outer",
              ["]["] = "@class.outer",
            },
            goto_previous_start = {
              ["[m"] = "@function.outer",
              ["[["] = "@class.outer",
            },
            goto_previous_end = {
              ["[M"] = "@function.outer",
              ["[]"] = "@class.outer",
            },
          },


        },
      }
    end
  }
end
