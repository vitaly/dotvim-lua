-- lua/layers/ide/lsp/trouble.lua

-- we want to be able to re-configure trouble when one of the toggles changes
-- for scope and visibility reasons we need to separate the call to config and config data

local toggle = require 'lib.toggle'

local configure
local configure_trouble = function()
  local config = configure()
  require('trouble').setup(config)
end

local DOCUMENT = 'document_diagnostics'
local WORKSPACE = 'workspace_diagnostics'
local QUICKFIX = 'quickfix'
local REFERENCES = 'lsp_references'
local LOCLIST = 'loclist'

------------------------------------------
-- toggle for diagnostics mode
vim.g.trouble_mode = vim.g.trouble_mode or 'document_diagnostics'
local mode_toggle = toggle.toggler('g:trouble_mode', { DOCUMENT, WORKSPACE, QUICKFIX, REFERENCES, LOCLIST }, configure_trouble)

--- @param value string toggle value to set
local function setter(value)
  return function()
    vim.g.trouble_mode = value
    configure_trouble()
  end
end

------------------------------------------
-- toggle for autoopen
local auto_open_toggle = toggle.toggler('g:trouble_autoopen', false, configure_trouble)

configure = function()
  if nil == vim.g.trouble_autoopen then
    vim.g.trouble_autoopen = false -- TODO: get defaults from global config. make it filetype scpecific
  end
  return {
    mode = vim.g.trouble_mode,
    auto_open = vim.g.trouble_autoopen,
    auto_close = true,
    action_keys = {
      jump = { '<cr>', '<tab>', '<2-LeftMouse>' },
    },
    -- TODO:
    -- use_diagnostic_signs = true,
  }
end

return {
  'folke/trouble.nvim', -- https://github.com/folke/trouble.nvim
  requires = 'kyazdani42/nvim-web-devicons',

  -- using `_config` becase we need `configure_trouble` from the scope
  _config = function()
    configure_trouble()

    require('which-key').register {

      -- TODO: more trouble bindings
      ['\\T'] = {
        name = 'Trouble',
        T = { '<cmd>TroubleToggle<cr>', 'Trouble' },
        a = { auto_open_toggle, 'Autoopen' },
        t = { mode_toggle, 'cycle mode' },
        m = {
          name = 'Mode',
          d = { setter(DOCUMENT), 'Document Diagnostic' },
          w = { setter(WORKSPACE), 'Workspace Diagnostic' },
        },
      },
    }
  end,
}

-- DEAFULTS:
-- position = "bottom", -- position of the list can be: bottom, top, left, right
-- height = 10, -- height of the trouble list when position is top or bottom
-- width = 50, -- width of the list when position is left or right
-- icons = true, -- use devicons for filenames
-- mode = "workspace_diagnostics", -- "workspace_diagnostics", "document_diagnostics", "quickfix", "lsp_references", "loclist"
-- fold_open = "", -- icon used for open folds
-- fold_closed = "", -- icon used for closed folds
-- group = true, -- group results by file
-- padding = true, -- add an extra new line on top of the list
-- action_keys = { -- key mappings for actions in the trouble list
--   -- map to {} to remove a mapping, for example:
--   -- close = {},
--   close = "q", -- close the list
--   cancel = "<esc>", -- cancel the preview and get back to your last window / buffer / cursor
--   refresh = "r", -- manually refresh
--   jump = {"<cr>", "<tab>"}, -- jump to the diagnostic or open / close folds
--   open_split = { "<c-x>" }, -- open buffer in new split
--   open_vsplit = { "<c-v>" }, -- open buffer in new vsplit
--   open_tab = { "<c-t>" }, -- open buffer in new tab
--   jump_close = {"o"}, -- jump to the diagnostic and close the list
--   toggle_mode = "m", -- toggle between "workspace" and "document" diagnostics mode
--   toggle_preview = "P", -- toggle auto_preview
--   hover = "K", -- opens a small popup with the full multiline message
--   preview = "p", -- preview the diagnostic location
--   close_folds = {"zM", "zm"}, -- close all folds
--   open_folds = {"zR", "zr"}, -- open all folds
--   toggle_fold = {"zA", "za"}, -- toggle fold of current file
--   previous = "k", -- previous item
--   next = "j" -- next item
-- },
-- indent_lines = true, -- add an indent guide below the fold icons
-- auto_open = false, -- automatically open the list when you have diagnostics
-- auto_close = false, -- automatically close the list when you have no diagnostics
-- auto_preview = true, -- automatically preview the location of the diagnostic. <esc> to close preview and go back to last window
-- auto_fold = false, -- automatically fold a file trouble list at creation
-- auto_jump = {"lsp_definitions"}, -- for the given modes, automatically jump if there is only a single result
-- signs = {
--   -- icons / text used for a diagnostic
--   error = "",
--   warning = "",
--   hint = "",
--   information = "",
--   other = "﫠"
-- },
-- use_diagnostic_signs = false -- enabling this will use the signs defined in your lsp client

-- TODO: cleanup
-- LSP(Refresh-Trouble)',     '<cmd>TroubleRefresh<cr>')
-- LSP(Document-Trouble)',    '<cmd>TroubleToggle document_diagnostics<cr>')
-- LSP(Workspace-Trouble)',   '<cmd>TroubleToggle workspace_diagnostics<cr>')
-- LSP(Definitions-Trouble)', '<cmd>TroubleToggle lsp_definitions<cr>')
-- LSP(References-Trouble)',  '<cmd>TroubleToggle lsp_references<cr>')

-- -- noremap('<plug>Refactor(rename)', '<cmd>lua require("lspsaga.rename").rename()<CR>')

-- require('which-key').register {
--   ['<leader>al'] = {
--     name = 'LSP',

--     t = {
--       name = 'Trouble',

--       d = { '<plug>LSP(Document-Trouble)', 'Document diagnostics' },
--       w = { '<plug>LSP(Workspace-Trouble)', 'Workspace diagnostics' },
--       l = { '<plug>LSP(Definitions-Trouble)', 'LSP definitions' },
--       r = { '<plug>LSP(References-Trouble)', 'LSP references' },
--       R = { '<plug>LSP(Refresh-Trouble)', 'Refresh' },
--     },
--   },
-- }