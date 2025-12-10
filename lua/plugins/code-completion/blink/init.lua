return {
  {
    'saghen/blink.cmp', -- https://github.com/saghen/blink.cmp

    dependencies = {
      {
        'L3MON4D3/LuaSnip', -- https://github.com/L3MON4D3/LuaSnip
        version = 'v2.*',

        dependencies = {
          'rafamadriz/friendly-snippets', -- https://github.com/rafamadriz/friendly-snippets
          config = function()
            require('luasnip.loaders.from_vscode').lazy_load()
            require('luasnip.loaders.from_vscode').lazy_load({ paths = my.root .. '/snippets' })
          end,
        },
      },

      {
        'giuxtaposition/blink-cmp-copilot', -- https://github.com/giuxtaposition/blink-cmp-copilot

        dependencies = {
          {
            'zbirenbaum/copilot.lua', -- https://github.com/zbirenbaum/copilot.lua

            dependencies = {
              {
                'copilotlsp-nvim/copilot-lsp', -- https://github.com/zbirenbaum/copilot.lua

                cmd = 'Copilot',
              },
            },
            opts = {
              suggestion = {
                enabled = true,
                auto_trigger = true,
                keymap = {
                  -- Don't map Tab here - we'll handle it in blink's keymap
                  accept = false,
                  accept_word = '<M-w>',
                  accept_line = '<M-l>',
                  next = '<M-]>',
                  prev = '<M-[>',
                  dismiss = '<C-]>',
                },
              },
              panel = { enabled = true },
            },
          },
        },
      },
    },
    version = '1.*',

    ---@module 'blink.cmp'
    ---@type blink.cmp.Config
    opts = {
      keymap = {
        preset = 'super-tab',
        ['<C-k>'] = { 'select_prev', 'fallback' },
        ['<C-j>'] = { 'select_next', 'fallback' },
        -- Super-tab with copilot.lua fallback
        ['<Tab>'] = {
          function(cmp)
            if cmp.snippet_active() then
              return cmp.accept()
            elseif cmp.is_visible() then
              return cmp.select_and_accept()
            elseif require('copilot.suggestion').is_visible() then
              require('copilot.suggestion').accept()
              return true
            end
          end,
          'snippet_forward',
          'fallback',
        },
      },
      completion = {
        -- Don't auto-select first item
        list = { selection = { preselect = false, auto_insert = true } },
        -- Show documentation popup
        documentation = { auto_show = true, auto_show_delay_ms = 200 },
        -- Ghost text preview
        ghost_text = { enabled = true },
      },
      sources = {
        default = { 'lazydev', 'lsp', 'path', 'snippets', 'buffer', 'copilot' },
        providers = {
          lazydev = {
            name = 'LazyDev',
            module = 'lazydev.integrations.blink',
            -- make lazydev completions top priority (see `:h blink.cmp`)
            score_offset = 100,
          },
          copilot = {
            name = 'copilot',
            module = 'blink-cmp-copilot',
            score_offset = 100,
            async = true,
          },
        },
      },
      snippets = { preset = 'luasnip' },
    },

    config = function(_, opts)
      require('blink.cmp').setup(opts)
      require('glue')
        .register('blink.cmp')
        .handle('completion.capabilities', function(_, args) return require('blink.cmp').get_lsp_capabilities((args or {}).capabilities or {}) end)
    end,
  },
}
