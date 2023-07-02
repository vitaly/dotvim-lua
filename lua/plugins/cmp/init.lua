return {

  {
    'L3MON4D3/LuaSnip', -- https://github.com/hrsh7th/vim-vsnip

    dependencies = {
      'rafamadriz/friendly-snippets', -- https://github.com/rafamadriz/friendly-snippets
      config = function()
        require('luasnip.loaders.from_vscode').lazy_load()
        require('luasnip.loaders.from_vscode').lazy_load { paths = my.root .. '/snippets' }
      end,
    },

    opts = {
      history = true,
      delete_check_events = 'TextChanged',
    },

    -- stylua: ignore
    keys = {
      {
        '<tab>',
        function()
          return require('luasnip').jumpable(1) and '<Plug>luasnip-jump-next' or '<tab>'
        end,
        expr = true, silent = true, mode = 'i',
      },
      { '<tab>', function() require('luasnip').jump(1) end, mode = 's', },
      { '<s-tab>', function() require('luasnip').jump(-1) end, mode = { 'i', 's' }, },
    },
  },

  {
    'github/copilot.vim', -- https://github.com/github/copilot.vim
    build = ':Copilot setup',

    event = 'InsertEnter',
    cmd = 'Copilot',

    keys = {
      { [[<leader>Sg]], [[<cmd>Copilot<cr>]], desc = 'Girhub Copilot Status' },
    },

    init = function()
      vim.g.copilot_no_tab_map = 1
      vim.g.copilot_assume_mapped = 1
    end,
  },

  {
    'hrsh7th/nvim-cmp', -- https://github.com/hrsh7th/nvim-cmp
    version = false,

    event = 'InsertEnter',

    dependencies = {
      'onsails/lspkind-nvim', -- https://github.com/onsails/lspkind-nvim
      'github/copilot.vim', -- https://github.com/github/copilot.vim

      -- LSP source
      'hrsh7th/cmp-nvim-lsp', -- https://github.com/hrsh7th/cmp-nvim-lsp
      -- buffer source
      'hrsh7th/cmp-buffer', -- https://github.com/hrsh7th/cmp-buffer
      -- command line source
      'hrsh7th/cmp-cmdline', -- https://github.com/hrsh7th/cmp-cmdline
      -- path source
      'hrsh7th/cmp-path', -- https://github.com/hrsh7th/cmp-path
      -- Nvim -- Lua API source
      'hrsh7th/cmp-nvim-lua', -- https://github.com/hrsh7th/cmp-nvim-lua
      -- snippets source
      'saadparwaiz1/cmp_luasnip', -- https://github.com/saadparwaiz1/cmp_luasnip
    },

    config = function(_, opts)
      vim.api.nvim_set_hl(0, 'CmpGhostText', { link = 'Comment', default = true })
      local cmp = require 'cmp'
      local luasnip = require 'luasnip'

      local select_next_item = cmp.mapping.select_next_item { behavior = cmp.SelectBehavior.Select }
      local select_prev_item = cmp.mapping.select_prev_item { behavior = cmp.SelectBehavior.Select }
      local tab_completion = function(fallback)
        -- if luasnip.expand_or_jumpable() then
        --   luasnip.expand_or_jump()
        -- end

        if cmp.confirm() then
          return
        end

        local copilot_result = vim.fn['copilot#Accept'] ''
        if copilot_result ~= '' then
          return vim.api.nvim_feedkeys(copilot_result, 'i', true)
        end

        fallback()
      end

      cmp.setup {
        -- * menu - use popup menu
        -- * menuone - user menu even if there's only one match
        -- * longest - only insert the longest common text of the matches
        -- * preview - show extra information about selected item
        -- * noinsert - do not insert any text until user selects match
        -- * noselect - do not select a match in the menu
        -- completion = { completeopt = 'menu,noselect,preview' },
        -- completion = { completeopt = 'menu,menuone,noinsert' },
        completion = { completeopt = 'menu,menuone,preview' },
        snippet = {
          expand = function(args)
            require('luasnip').lsp_expand(args.body)
          end,
        },

        mapping = cmp.mapping.preset.insert {
          ['<tab>'] = { i = tab_completion },
          ['<s-tab>'] = { i = cmp.mapping.abort() },

          ['<c-j>'] = { i = select_next_item },
          ['<c-k>'] = { i = select_prev_item },

          ['<c-b>'] = { i = cmp.mapping.scroll_docs(-4) },
          ['<c-f>'] = { i = cmp.mapping.scroll_docs(4) },

          -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
          ['<cr>'] = { i = cmp.mapping.confirm { select = true } },
          -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
          ['<s-cr>'] = { i = cmp.mapping.confirm { behavior = cmp.ConfirmBehavior.Replace, select = true } },
        },

        sources = cmp.config.sources {
          { name = 'nvim_lsp' }, -- lsp
          { name = 'luasnip' }, -- snippets
          { name = 'nvim_lua' }, -- nvim lua api
          -- { name = 'neorg' }, -- Neorg
          -- }, {
          { name = 'path' }, -- filesystem
          { name = 'buffer' }, -- buffer strings
        },
        formatting = {
          format = require('lspkind').cmp_format {
            mode = 'symbol_text', -- show only symbol annotations
            maxwidth = 50, -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
            ellipsis_char = '...', -- when popup menu exceed maxwidth, the truncated part would show ellipsis_char instead (must define maxwidth first)

            menu = {
              buffer = '[BUF]',
              nvim_lsp = '[LSP]',
              path = '[PATH]',
              vsnip = '[SNIP]',
              nvim_lua = '[LUA]',
              cmdline = '[CMD]',
            },
            -- The function below will be called before any actual modifications from lspkind
            -- so that you can provide more controls on popup customization. (See [#30](https://github.com/onsails/lspkind-nvim/pull/30))
            -- before = function (entry, vim_item)
            --   ...
            --   return vim_item
            -- end
          },
        },
        experimental = {
          -- native_menu = false,
          ghost_text = true,
          -- ghost_text = { hl_group = "CmpGhostText", },
        },
      }

      -- `/` cmdline setup.
      cmp.setup.cmdline('/', {
        mapping = cmp.mapping.preset.cmdline {
          ['<C-j>'] = { c = select_next_item },
          ['<C-k>'] = { c = select_prev_item },
        },
        sources = {
          { name = 'buffer' },
        },
      })

      -- `:` cmdline setup.
      cmp.setup.cmdline(':', {
        mapping = cmp.mapping.preset.cmdline {
          ['<C-j>'] = { c = select_next_item },
          ['<C-k>'] = { c = select_prev_item },
        },
        sources = cmp.config.sources({
          { name = 'path' },
        }, {
          { name = 'cmdline' },
        }),
      })
    end,
  },
}
