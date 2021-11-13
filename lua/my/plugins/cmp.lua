return function (use)
  use {
    {},
    {
      'hrsh7th/nvim-cmp',
      requires = {
        'L3MON4D3/LuaSnip',
        { 'hrsh7th/cmp-buffer', after = 'nvim-cmp' },
        'hrsh7th/cmp-nvim-lsp',
        { 'hrsh7th/cmp-path', after = 'nvim-cmp' },
        { 'hrsh7th/cmp-nvim-lua', after = 'nvim-cmp' },
        { 'saadparwaiz1/cmp_luasnip', after = 'nvim-cmp' },
      },

      config = function ()

        local cmp = require 'cmp'
        local luasnip = require 'luasnip'

        local lspkind = require 'lspkind'

        local kind_symbols = {
          -- Text = '',
          Method = 'Ƒ',
          Function = 'ƒ',
          -- Constructor = '',
          -- Variable = '',
          -- Class = '',
          -- Interface = 'ﰮ',
          -- Module = '',
          -- Property = '',
          -- Unit = '',
          -- Value = '',
          -- Enum = '了',
          -- Keyword = '',
          -- Snippet = '﬌',
          -- Color = '',
          -- File = '',
          -- Folder = '',
          -- EnumMember = '',
          -- Constant = '',
          -- Struct = '',
          --
          -- Text = "",
          -- Method = "",
          -- Function = "",
          -- Constructor = "",
          -- Field = "ﰠ",
          -- Variable = "",
          -- Class = "ﴯ",
          -- Interface = "",
          -- Module = "",
          -- Property = "ﰠ",
          -- Unit = "塞",
          -- Value = "",
          -- Enum = "",
          -- Keyword = "",
          -- Snippet = "",
          -- Color = "",
          -- File = "",
          -- Reference = "",
          -- Folder = "",
          -- EnumMember = "",
          -- Constant = "",
          -- Struct = "פּ",
          -- Event = "",
          -- Operator = "",
          -- TypeParameter = "",
        }

        -- lspkind.init { symbol_map = kind_symbols }

        lspkind.init {
          with_text = true,
          preset = 'default',
          symbol_map = kind_symbols,
      }

        cmp.setup {
          completion = { completeopt = 'menu,menuone,noinsert.noselect,preview' },

          snippet = {
            expand = function(args)
              luasnip.lsp_expand(args.body)
            end,
          },

          formatting = {
            format = lspkind.cmp_format({maxwidth = 50})
          },


          -- formatting = {
          --   format = function(_, vim_item)
          --     vim_item.kind = lspkind.presets.default[vim_item.kind] .. ' ' .. vim_item.kind
          --     return vim_item
          --   end,
          -- },

          sources = {
            { name = 'buffer' },
            { name = 'nvim_lsp' },
            { name = 'nvim_lua' },
            { name = 'path' },
            { name = 'luasnip' },
          },
        }


      end,

      event = 'InsertEnter *',

    },

  }

end
