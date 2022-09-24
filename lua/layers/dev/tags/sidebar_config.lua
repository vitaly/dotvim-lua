-- lua/layers/dev/tags/sidebar_config.lua

return {
  'sidebar-nvim/sidebar.nvim', -- https://github.com/sidebar-nvim/sidebar.nvim

  config = function()
    require('sidebar-nvim').setup {
      hide_statusline = true,
      sections = { 'symbols', 'git', 'todos', 'buffers', 'diagnostics' },
    }

    require('which-key').register {
      ['\\t'] = { require('sidebar-nvim').toggle, 'Sidebar' },
    }
  end,
}

-- DEFAULTS:
-- disable_default_keybindings = 0,
-- bindings = nil,
-- open = false,
-- side = "left",
-- initial_width = 35,
-- hide_statusline = false,
-- update_interval = 1000,
-- sections = { "datetime", "git", "diagnostics" },
-- section_separator = {"", "-----", ""},
-- section_title_separator = {""},
-- containers = {
--     attach_shell = "/bin/sh", show_all = true, interval = 5000,
-- },
-- datetime = { format = "%a %b %d, %H:%M", clocks = { { name = "local" } } },
-- todos = { ignored_paths = { "~" } },
