local position = function() return require('onion.config').get('file-tree.position') or 'left' end

local reveal = function() vim.cmd([[Neotree filesystem ]] .. position() .. [[ reveal reveal_force_cwd]]) end
local popup = function() vim.cmd([[Neotree filesystem float reveal reveal_force_cwd]]) end
local toggle = function() vim.cmd([[Neotree filesystem ]] .. position() .. [[ focus toggle=true]]) end
local function toggle_or_reveal()
  if vim.o.buflisted and '' ~= vim.fn.expand('%:p') then
    reveal()
  else
    toggle()
  end
end

return {

  'nvim-neo-tree/neo-tree.nvim', -- https://github.com/nvim-neo-tree/neo-tree.nvim

  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
    'MunifTanjim/nui.nvim',
  },

  lazy = false, -- so that opening a directory will work

  cmd = 'Neotree',

  deactivate = function() vim.cmd([[Neotree close]]) end,

  keys = {
    { '\\\\', popup, desc = 'Quick File Popup' },
    { '\\[', toggle, desc = 'Toggle File Tree' },
    { '\\]', toggle_or_reveal, desc = 'Toggle / Reveal File' },
  },

  init = function()
    vim.g.neo_tree_remove_legacy_commands = 1

    -- hack to open tree when vim runs with single directory argument
    if vim.fn.argc() == 1 then
      ---@diagnostic disable-next-line: param-type-mismatch
      local stat = vim.uv.fs_stat(vim.fn.argv(0))
      if stat and stat.type == 'directory' then require('neo-tree') end
    end
  end,

  opts = {
    source_selector = { winbar = true },
    sources = { 'filesystem', 'buffers', 'git_status', 'document_symbols' },

    use_popups_for_input = false, -- If false, inputs will use vim.ui.input() instead of custom floats.
    close_if_last_window = true,
    sort_case_insensitive = true,

    enable_refresh_on_write = false, -- requires use_libuv_file_watcher = true

    filesystem = {
      group_empty_dirs = true,
      follow_current_file = true,
      use_libuv_file_watcher = true,
    },

    open_files_do_not_replace_types = { 'terminal', 'Trouble', 'qf', 'Outline' },

    default_component_configs = {
      icon = {
        default = '',
        folder_empty = '',
      },
      git_status = {
        symbols = {
          deleted = '',
          modified = '',
          renamed = '󰁕',
          staged = '✓',
          unstaged = '✗',
          untracked = '?',
        },
      },
    }, -- default_component_configs

    window = {
      mappings = {
        ['r'] = { 'move', config = { show_path = 'relative' } }, -- no need not to allow to move for rename ;)
        ['m'] = { 'move', config = { show_path = 'relative' } },
        ['<esc>'] = 'close_window',
      },
      popup = {
        size = {
          width = '40',
        },
        position = '50%',
      },
    },
  },

  config = function(_, opts)
    -- my.log.debug 'neotree'
    opts.window.position = position()
    require('neo-tree').setup(opts)
    require('lib.au').command('neotree.termclose', 'TermClose', function()
      if package.loaded['neo-tree.sources.git_status'] then require('neo-tree.sources.git_status').refresh() end
    end)
  end,
}
