-- lua/layers/ide/cmp/config.lua

return {

  setup = function()
    require('layers.ide.cmp.style').setup()

    local feedkey = function(key, mode)
      vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(key, true, true, true), mode, true)
    end

    local cmp = require 'cmp'

    local function tab_completion(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif vim.fn['vsnip#available'](1) == 1 then
        feedkey('<Plug>(vsnip-expand-or-jump)', '')
      else
        local copilot_result = vim.fn['copilot#Accept'] ''
        if copilot_result ~= '' then
          vim.api.nvim_feedkeys(copilot_result, 'i', true)
        else
          fallback()
        end
      end
    end

    local function next_item(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      else
        fallback()
      end
    end

    local function prev_item(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      else
        fallback()
      end
    end

    cmp.setup {
      completion = { completeopt = 'menu,noselect,preview' },

      snippet = {
        expand = function(args)
          vim.fn['vsnip#anonymous'](args.body)
        end,
      },

      sources = cmp.config.sources({
        -- nvim lua api
        { name = 'nvim_lua' },
        -- lsp
        { name = 'nvim_lsp' },
        --snippets
        { name = 'vsnip' },
      }, {
        -- filesystem
        { name = 'path' },
        -- buffer strings
        { name = 'buffer' },
      }),

      formatting = {
        format = require('lspkind').cmp_format {
          mode = 'symbol_text',
          maxwidth = 50,
          menu = {
            buffer = '[BUF]',
            nvim_lsp = '[LSP]',
            path = '[PATH]',
            vsnip = '[SNIP]',
            nvim_lua = '[LUA]',
            cmdline = '[CMD]',
          },
        },
      },

      mapping = cmp.mapping.preset.insert {
        ['<cr>'] = { i = cmp.mapping.confirm() },
        ['<tab>'] = { i = tab_completion },
        ['<c-j>'] = { i = next_item },
        ['<c-k>'] = { i = prev_item },

        -- ['<esc>'] = { i = cmp.mapping.abort() },
      },
    }

    -- `/` cmdline setup.
    cmp.setup.cmdline('/', {
      mapping = cmp.mapping.preset.cmdline {
        ['<C-j>'] = { c = next_item },
        ['<C-k>'] = { c = prev_item },
      },
      sources = {
        { name = 'buffer' },
      },
    })

    -- `:` cmdline setup.
    cmp.setup.cmdline(':', {
      mapping = cmp.mapping.preset.cmdline {
        ['<C-j>'] = { c = next_item },
        ['<C-k>'] = { c = prev_item },
      },
      sources = cmp.config.sources({
        { name = 'path' },
      }, {
        { name = 'cmdline' },
      }),
    })
  end,

  -- TODO: check if we can do it on attach
  capabilities = function()
    return require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
  end,
}

-- -- local luasnip = require 'luasnip'

-- local goup = function(fallback)
--   return cmp.mapping.select_prev_item { behavior = cmp.SelectBehavior.Insert }(fallback)
-- end

-- vim.g.vsnip_snippet_dir = vim.g.my_ROOT .. '/snippets'

-- cmp.setup {
--   completion = { completeopt = 'menu,noselect,preview' },

--   experimental = {
--     native_menu = false,
--     ghost_text = false,
--   },

--   mapping = {
--     -- select = false is esential, otherwise it will interfere with normal ENTER when there's a popup open
--     ['<CR>'] = cmp.mapping.confirm { select = false, behavior = cmp.ConfirmBehavior.Replace }, -- XXX: WTF is ConfirmBehavior.Replace
--     -- ['<CR>']    = cmp.mapping.confirm({ select = true }),

--     ['<Down>'] = cmp.mapping(cmp.mapping.select_next_item { behavior = cmp.SelectBehavior.Insert }, { 'i', 'c' }),
--     -- ['<Down>'] = cmp.mapping(cmp.mapping.select_next_item { behavior = cmp.SelectBehavior.Insert }, { 'i', 'c' }),
--     -- ['<C-j>'] = cmp.mapping(cmp.mapping.select_next_item { behavior = cmp.SelectBehavior.Insert }, { 'i', 'c' }),
--     -- ['<C-j>'] = cmp.mapping {
--     --   i = cmp.mapping.select_next_item { behavior = cmp.SelectBehavior.Select },
--     --   c = cmp.mapping.select_next_item { behavior = cmp.SelectBehavior.Insert }, -- for some reason 'Select' doesn't work in command line completion
--     -- },

--     ['<Up>'] = cmp.mapping(goup, { 'i', 'c' }),
--     -- ['<Up>'] = cmp.mapping(cmp.mapping.select_prev_item { behavior = cmp.SelectBehavior.Insert }, { 'i', 'c' }),
--     -- ['<C-k>'] = cmp.mapping(cmp.mapping.select_prev_item { behavior = cmp.SelectBehavior.Insert }, { 'i', 'c' }),
--     -- ['<C-k>'] = cmp.mapping {
--     --   i = cmp.mapping.select_prev_item { behavior = cmp.SelectBehavior.Select },
--     --   c = cmp.mapping.select_prev_item { behavior = cmp.SelectBehavior.Insert }, -- for some reason 'Select' doesn't work in command line completion
--     -- },

--     ['<Tab>'] = cmp.mapping(function(--[[ fallback --]])
--       if cmp.visible() then
--         cmp.select_next_item { behavior = cmp.SelectBehavior.Insert }

--         -- elseif require("luasnip").expand_or_jumpable() then
--       elseif vim.fn['vsnip#jumpable'](1) > 0 then
--         -- vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Plug>luasnip-expand-or-jump", true, true, true), "")
--         vim.fn.feedkeys(vim.api.nvim_replace_termcodes('<Plug>(vsnip-expand-or-jump)', true, true, true), '')
--       else
--         -- fallback()
--         -- this will fire Copilot's Accept with fallback of <tab>
--         vim.fn.feedkeys(vim.api.nvim_replace_termcodes('<C-Space>', true, true, true), '')
--       end
--     end, { 'i', 's' }),

--     ['<S-Tab>'] = cmp.mapping(function(fallback)
--       if cmp.visible() then
--         cmp.select_prev_item { behavior = cmp.SelectBehavior.Insert }
--         -- elseif require("luasnip").jumpable() then
--       elseif vim.fn['vsnip#jumpable'](-1) then
--         vim.fn.feedkeys(vim.api.nvim_replace_termcodes('<Plug>(vsnip-jump-prev)', true, true, true), '')
--       else
--         fallback()
--       end
--     end, { 'i', 's' }),

--     ['<C-b>'] = cmp.mapping.scroll_docs(-5),
--     ['<C-f>'] = cmp.mapping.scroll_docs(5),

--     ['<C-e>'] = cmp.mapping.close(),
--     -- ["<esc>"]   = cmp.mapping.close(),
--   },

--   sources = {
--     { name = 'vsnip' },
--     { name = 'nvim_lsp' },
--     { name = 'nvim_lua' },
--     { name = 'neorg' },
--     { name = 'path' },
--     -- { name = 'luasnip' },
--     { name = 'buffer' },
--     { name = 'calc' },
--   },
-- }

-- local autopairs = require 'nvim-autopairs'
-- -- XXX do this only for ruby
-- autopairs.add_rules(require 'nvim-autopairs.rules.endwise-ruby')
-- autopairs.add_rules(require 'nvim-autopairs.rules.endwise-lua')

-- cmp.event:on('confirm_done', require('nvim-autopairs.completion.cmp').on_confirm_done { map_char = { tex = '' } })
