-- lua/layers/ide/tsitter/todo.lua

return {
  'vitaly/todo-comments.nvim', -- https://github.com/folke/todo-comments.nvim
  -- 'vitaly/todo-comments.nvim',
  requires = 'nvim-lua/plenary.nvim',

  config = function()
    require('todo-comments').setup {
      keywords = {
        TODO = { icon = ' ', color = 'info', alt = { 'TBD' } },
      },
    }

    require('which-key').register {
      ['<leader>'] = {
        -- T = { '<cmd>TodoTrouble<cr>', 'TODO' },
        T = { '<cmd>TodoTelescope theme=ivy<cr>', 'TODO' },
      },
    }
  end,
}

-- TEST: fix highlights
-- hi def TodoBgTEST guibg=#cc342b guifg=#ffffff gui=BOLD                                                                                                                                         │        else else                     │││  ┃ 175     print("hi def TodoFg" .. kw .. " guibg=NONE guifg=" .. hex .. " gui=" .. fg_gui)
-- hi def TodoFgTEST guibg=NONE guifg=#cc342b gui=NONE                                                                                                                                            │      ├  if if not hex then            │││    176     vim.cmd("hi def TodoFg" .. kw .. " guibg=NONE guifg=" .. hex .. " gui=" .. fg_gui)
-- hi def TodoSignTEST guibg=#ffffff guifg=#cc342b gui=NONE
--
-- hi def TodoBgTEST guibg=#db2d20 guifg=#a5a2a2 gui=BOLD                                                                                                                                         │      ├  if if not hex then            │││    176     vim.cmd("hi def TodoFg" .. kw .. " guibg=NONE guifg=" .. hex .. " gui=" .. fg_gui)
-- hi def TodoFgTEST guibg=NONE guifg=#db2d20 gui=NONE                                                                                                                                            │      └  fg                            │││  ┃ 177
-- hi def TodoSignTEST guibg=#090300 guifg=#db2d20 gui=NONE

-- lua require('layers/ide/tsitter/todo').config()

-- DEFAULTS:
-- {
--   signs = true, -- show icons in the signs column
--   sign_priority = 8, -- sign priority
--   -- keywords recognized as todo comments
--   keywords = {
--     FIX = {
--       icon = " ", -- icon used for the sign, and in search results
--       color = "error", -- can be a hex color, or a named color (see below)
--       alt = { "FIXME", "BUG", "FIXIT", "ISSUE" }, -- a set of other keywords that all map to this FIX keywords
--       -- signs = false, -- configure signs for some keywords individually
--     },
--     TODO = { icon = " ", color = "info" },
--     HACK = { icon = " ", color = "warning" },
--     WARN = { icon = " ", color = "warning", alt = { "WARNING", "XXX" } },
--     PERF = { icon = " ", alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE" } },
--     NOTE = { icon = " ", color = "hint", alt = { "INFO" } },
--     TEST = { icon = "⏲ ", color = "test", alt = { "TESTING", "PASSED", "FAILED" } },
--   },
--   gui_style = {
--     fg = "NONE", -- The gui style to use for the fg highlight group.
--     bg = "BOLD", -- The gui style to use for the bg highlight group.
--   },
--   merge_keywords = true, -- when true, custom keywords will be merged with the defaults
--   -- highlighting of the line containing the todo comment
--   -- * before: highlights before the keyword (typically comment characters)
--   -- * keyword: highlights of the keyword
--   -- * after: highlights after the keyword (todo text)
--   highlight = {
--     before = "", -- "fg" or "bg" or empty
--     keyword = "wide", -- "fg", "bg", "wide", "wide_bg", "wide_fg" or empty. (wide and wide_bg is the same as bg, but will also highlight surrounding characters, wide_fg acts accordingly but with fg)
--     after = "fg", -- "fg" or "bg" or empty
--     pattern = [[.*<(KEYWORDS)\s*:]], -- pattern or table of patterns, used for highlightng (vim regex)
--     comments_only = true, -- uses treesitter to match keywords in comments only
--     max_line_len = 400, -- ignore lines longer than this
--     exclude = {}, -- list of file types to exclude highlighting
--   },
--   -- list of named colors where we try to extract the guifg from the
--   -- list of highlight groups or use the hex color if hl not found as a fallback
--   colors = {
--     error = { "DiagnosticError", "ErrorMsg", "#DC2626" },
--     warning = { "DiagnosticWarning", "WarningMsg", "#FBBF24" },
--     info = { "DiagnosticInfo", "#2563EB" },
--     hint = { "DiagnosticHint", "#10B981" },
--     default = { "Identifier", "#7C3AED" },
--     test = { "Identifier", "#FF00FF" }
--   },
--   search = {
--     command = "rg",
--     args = {
--       "--color=never",
--       "--no-heading",
--       "--with-filename",
--       "--line-number",
--       "--column",
--     },
--     -- regex that will be used to match keywords.
--     -- don't replace the (KEYWORDS) placeholder
--     pattern = [[\b(KEYWORDS):]], -- ripgrep regex
--     -- pattern = [[\b(KEYWORDS)\b]], -- match without the extra colon. You'll likely get false positives
--   },
-- }
