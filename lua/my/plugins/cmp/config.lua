local cmp = require 'cmp'

local lspkind = require 'lspkind'

local kind_symbols = require('my.config.icons').nvimtree

lspkind.init {
  with_text = true,
  preset = 'default',
  symbol_map = kind_symbols,
}

-- local luasnip = require 'luasnip'

local goup = function(fallback)
  print 'go up'
  return cmp.mapping.select_prev_item { behavior = cmp.SelectBehavior.Insert }(fallback)
end

cmp.setup {
  completion = { completeopt = 'menu,noselect,preview' },

  experimental = {
    native_menu = false,
    ghost_text = false,
  },

  snippet = {
    expand = function(args)
      vim.fn['vsnip#anonymous'](args.body)
      -- luasnip.lsp_expand(args.body)
    end,
  },

  mapping = {
    -- select = false is esential, otherwise it will interfere with normal ENTER when there's a popup open
    ['<CR>'] = cmp.mapping.confirm { select = false, behavior = cmp.ConfirmBehavior.Replace }, -- XXX: WTF is ConfirmBehavior.Replace
    -- ['<CR>']    = cmp.mapping.confirm({ select = true }),

    ['<Down>'] = cmp.mapping(cmp.mapping.select_next_item { behavior = cmp.SelectBehavior.Insert }, { 'i', 'c' }),
    -- ['<Down>'] = cmp.mapping(cmp.mapping.select_next_item { behavior = cmp.SelectBehavior.Insert }, { 'i', 'c' }),
    -- ['<C-j>'] = cmp.mapping(cmp.mapping.select_next_item { behavior = cmp.SelectBehavior.Insert }, { 'i', 'c' }),
    -- ['<C-j>'] = cmp.mapping {
    --   i = cmp.mapping.select_next_item { behavior = cmp.SelectBehavior.Select },
    --   c = cmp.mapping.select_next_item { behavior = cmp.SelectBehavior.Insert }, -- for some reason 'Select' doesn't work in command line completion
    -- },

    ['<Up>'] = cmp.mapping(goup, { 'i', 'c' }),
    -- ['<Up>'] = cmp.mapping(cmp.mapping.select_prev_item { behavior = cmp.SelectBehavior.Insert }, { 'i', 'c' }),
    -- ['<C-k>'] = cmp.mapping(cmp.mapping.select_prev_item { behavior = cmp.SelectBehavior.Insert }, { 'i', 'c' }),
    -- ['<C-k>'] = cmp.mapping {
    --   i = cmp.mapping.select_prev_item { behavior = cmp.SelectBehavior.Select },
    --   c = cmp.mapping.select_prev_item { behavior = cmp.SelectBehavior.Insert }, -- for some reason 'Select' doesn't work in command line completion
    -- },

    ['<Tab>'] = cmp.mapping(function(--[[ fallback --]])
      if cmp.visible() then
        cmp.select_next_item { behavior = cmp.SelectBehavior.Insert }

        -- elseif require("luasnip").expand_or_jumpable() then
      elseif vim.fn['vsnip#jumpable'](1) > 0 then
        -- vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Plug>luasnip-expand-or-jump", true, true, true), "")
        vim.fn.feedkeys(vim.api.nvim_replace_termcodes('<Plug>(vsnip-expand-or-jump)', true, true, true), '')
      else
        -- fallback()
        vim.fn.feedkeys(vim.api.nvim_replace_termcodes('<C-Space>', true, true, true), '')
      end
    end, { 'i', 's' }),

    ['<S-Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item { behavior = cmp.SelectBehavior.Insert }
        -- elseif require("luasnip").jumpable() then
      elseif vim.fn['vsnip#jumpable'](-1) then
        vim.fn.feedkeys(vim.api.nvim_replace_termcodes('<Plug>(vsnip-jump-prev)', true, true, true), '')
      else
        fallback()
      end
    end, { 'i', 's' }),

    ['<C-b>'] = cmp.mapping.scroll_docs(-5),
    ['<C-f>'] = cmp.mapping.scroll_docs(5),

    ['<C-e>'] = cmp.mapping.close(),
    -- ["<esc>"]   = cmp.mapping.close(),
  },

  formatting = {
    format = lspkind.cmp_format { maxwidth = 50 },
  },

  sources = {
    { name = 'vsnip' },
    { name = 'nvim_lsp' },
    { name = 'nvim_lua' },
    { name = 'neorg' },
    { name = 'path' },
    -- { name = 'luasnip' },
    { name = 'buffer' },
    { name = 'calc' },
  },
}

local autopairs = require 'nvim-autopairs'
autopairs.setup {
  disable_filetype = { 'TelescopePrompt', 'vim' },
}
-- XXX do this only for ruby
autopairs.add_rules(require 'nvim-autopairs.rules.endwise-ruby')
autopairs.add_rules(require 'nvim-autopairs.rules.endwise-lua')

cmp.event:on('confirm_done', require('nvim-autopairs.completion.cmp').on_confirm_done { map_char = { tex = '' } })
