return {
  {
    'saghen/blink.cmp', -- https://github.com/saghen/blink.cmp

    dependencies = {
      'rafamadriz/friendly-snippets', -- https://github.com/rafamadriz/friendly-snippets
      { 'L3MON4D3/LuaSnip', version = 'v2.*' }, -- https://github.com/L3MON4D3/LuaSnip

      'giuxtaposition/blink-cmp-copilot', -- https://github.com/giuxtaposition/blink-cmp-copilot
    },
    version = '1.*',

    ---@module 'blink.cmp'
    ---@type blink.cmp.Config
    opts = {
      keymap = { preset = 'default' },
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
    },
  },
  {
    'copilotlsp-nvim/copilot-lsp', -- https://github.com/zbirenbaum/copilot.lua

    cmd = 'Copilot',
  },
}
