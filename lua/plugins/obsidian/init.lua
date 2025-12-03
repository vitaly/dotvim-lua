return {

  {
    'obsidian-nvim/obsidian.nvim',
    version = '*', -- recommended, use latest release instead of latest commit
    event = {
      'BufReadPre ' .. vim.fn.expand('~') .. '/Obsidian/*.md',
    },

    cmd = { 'Obsidian' },

    ---@module 'obsidian'
    ---@type obsidian.config
    opts = {
      legacy_commands = false, -- this will be removed in the next major release
      workspaces = {
        {
          name = 'main',
          path = '~/Obsidian/Main',
        },
      },

      ui = {
        enable = false,
      },

      checkbox = {
        order = { ' ', 'x', '*', '~', '!', '>' },
      },
    },
  },

  {
    'MeanderingProgrammer/render-markdown.nvim', -- https://github.com/MeanderingProgrammer/render-markdown.nvim

    dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-mini/mini.icons' },

    enabled = true,

    ---@module 'render-markdown'
    ---@type render.md.UserConfig
    opts = {
      completions = { lsp = { enabled = true } },

      anti_conceal = {
        ignore = {
          -- check_icon = false,
          -- check_scope = true,
          code_border = true,
          code_language = true,
          quote = true,
        },
      },

      --            ⧆  
      checkbox = {
        unchecked = { icon = ' ' },
        checked = { icon = ' ' },
        custom = {
          todo = { raw = '[-]', rendered = ' ', highlight = 'RenderMarkdownTodo', scope_highlight = nil },
          exclamation = { raw = '[!]', rendered = '󱈸 ', highlight = 'RenderMarkdownTodo', scope_highlight = nil },
          tilda = { raw = '[~]', rendered = '󰜥 ', highlight = 'RenderMarkdownTodo', scope_highlight = nil },
          angle = { raw = '[>]', rendered = ' ', highlight = 'RenderMarkdownTodo', scope_highlight = nil },
          star = { raw = '[*]', rendered = '  ', highlight = 'RenderMarkdownTodo', scope_highlight = nil },
        },
      },
    },
  },

  {
    'OXY2DEV/markview.nvim',
    lazy = false,
    enabled = false,

    -- Completion for `blink.cmp`
    -- dependencies = { "saghen/blink.cmp" },
  },
}
