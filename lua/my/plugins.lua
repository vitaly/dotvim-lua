local plugins = require('my.packer.init')
local use = plugins.use
local plugin = plugins.plugin

use { 'wbthomason/packer.nvim', opt = true }
use { 'lewis6991/impatient.nvim' }
use { 'nvim-lua/plenary.nvim' }
-- https://github.com/svermeulen/vimpeccable
use { 'svermeulen/vimpeccable' }

plugin('my.plugins.which-key')
plugin('my.plugins.fuzzy')
plugin('my.plugins.lsp')
plugin('my.plugins.cmp')


use {
  'vitaly/vim-tmux-navigator',
  config = function ()
    vim.cmd [[
      noremap <silent> <plug>(Window/Up)    :TmuxNavigateUp<CR>
      noremap <silent> <plug>(Window/Down)  :TmuxNavigateDown<CR>
      noremap <silent> <plug>(Window/Left)  :TmuxNavigateLeft<CR>
      noremap <silent> <plug>(Window/Right) :TmuxNavigateRight<CR>

      nmap <leader>wk <plug>(Window/Up)
      nmap <leader>wj <plug>(Window/Down)
      nmap <leader>wh <plug>(Window/Left)
      nmap <leader>wl <plug>(Window/Right)

      cmap <silent> <m-k> :<C-U>TmuxNavigateUp<CR>
      cmap <silent> <m-j> :<C-U>TmuxNavigateDown<CR>
      cmap <silent> <m-h> :<C-U>TmuxNavigateLeft<CR>
      cmap <silent> <m-l> :<C-U>TmuxNavigateRight<CR>

      tmap <m-k> <C-\><C-n><plug>(Window/Up)
      tmap <m-j> <C-\><C-n><plug>(Window/Down)
      tmap <m-h> <C-\><C-n><plug>(Window/Left)
      tmap <m-l> <C-\><C-n><plug>(Window/Right)
    ]]
  end

}

use {
  'mbbill/undotree',
  config = function ()
    vim.cmd [[
      noremap             <plug>(Toggle/Unfo-Tree) :UndotreeToggle<CR>
      nmap    <leader>Tu  <plug>(Toggle/Unfo-Tree)

      " alias for quick access
      map                 <plug>(Toggle-Unfo-Tree) <plug>(Toggle/Unfo-Tree)
      nmap <leader>u      <plug>(Toggle-Unfo-Tree)

      nmap g= :later<cr>
   ]]
  end
}

use { 'chriskempson/base16-vim' }

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

            -- ['iF'] = {
            --   python = '(function_definition) @function',
            --   cpp = '(function_definition) @function',
            --   c = '(function_definition) @function',
            --   java = '(method_declaration) @function',
            -- },

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


use {
  'danymat/neogen',
  requires = 'nvim-treesitter',
  config = function ()
    require('neogen').setup {
      enabled = true,
      jump_map = '<tab>',
    }

    local vimp = require('vimp')

    local noremap = vimp.noremap
    noremap('<plug>Neogen(generate)',          '<cmd>lua require("neogen").generate()<cr>')
    noremap('<plug>Neogen(generate-func)',     '<cmd>lua require("neogen").generate({ type = "func" })<cr>')
    noremap('<plug>Neogen(generate-class)',    '<cmd>lua require("neogen").generate({ type = "class" })<cr>')
    noremap('<plug>Neogen(generate-type)',     '<cmd>lua require("neogen").generate({ type = "type" })<cr>')

    local nmap = vimp.nmap
    nmap('<localleader>dd',  '<plug>Neogen(generate)')
    nmap('<localleader>df', '<plug>Neogen(generate-func)')
    nmap('<localleader>dc', '<plug>Neogen(generate-class)')
    nmap('<localleader>dt', '<plug>Neogen(generate-type)')

  end,
  keys = { '<localleader>dd', '<localleader>df', '<localleader>dc', '<localleader>dt' },
}


puts 'my.plugins loaded'

return plugins
