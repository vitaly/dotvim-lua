local glue = require('glue').register('picker')

local function _map(event)
  return function() return glue.call(event) end
end

return require('lib.tools').vplug({
  'plugins.picker',

  dependencies = {
    'nvim-telescope/telescope.nvim', -- https://github.com/nvim-telescope/telescope.nvim
    'folke/snacks.nvim', -- https://github.com/folke/snacks.nvim
  },

  keys = {
    { [[<localleader><localleader>]], _map('snacks.actions.pick.file.smart'), desc = 'Find File' },

    { [[<leader>/]], _map('snacks.actions.grep'), desc = 'Grep in Files' },
    { [[<leader><cr>]], _map('snacks.actions.pick.command'), desc = 'Find Command' },
    { [[<leader>:]], _map('snacks.actions.pick.history.command'), desc = 'Search Command History' },

    { [[??]], _map('snacks.actions.pick.help'), desc = 'Find Help' },
    { [[?k]], _map('snacks.actions.pick.keymap'), desc = 'Find Keymaps' },
    { [[?m]], _map('telescope.actions.pick.man'), desc = 'Man Pages' },

    { [[<leader>sd]], _map('telescope.actions.pick.diagnostic.buffer'), desc = 'Buffer Diagnostics' },
    { [[<leader>sa]], _map('telescope.actions.pick.autocommand'), desc = 'Autocommands' },
    { [[<leader>bb]], _map('telescope.actions.pick.buffer'), desc = 'Find buffer' },
    { [[<leader>sb]], _map('telescope.actions.pick.buffer'), desc = 'Find buffer' },
    { [[<leader>sC]], _map('telescope.actions.pick.colorscheme'), desc = 'Find Colorscheme' },
    { [[<leader>s:]], _map('telescope.actions.pick.history.command'), desc = 'Command History' },
    { [[<leader>sc]], _map('telescope.actions.pick.command'), desc = 'Find Command' },
    { [[<leader>sD]], _map('telescope.actions.pick.diagnostic'), desc = 'Diagnostics' },
    { [[<leader>ff]], _map('telescope.actions.pick.file'), desc = 'Find File' },
    { [[<leader>gc]], _map('telescope.actions.pick.git.log'), desc = 'Find Git Commit' },
    { [[<leader>gf]], _map('telescope.actions.pick.file.git'), desc = 'Find Git File' },
    { [[<leader>gS]], _map('telescope.actions.pick.git.status'), desc = 'Find Git Status' },
    { [[<leader>sg]], _map('telescope.actions.grep.word'), desc = 'Grep String' },
    { [[<leader>sh]], _map('telescope.actions.pick.help'), desc = 'Help Tags' },
    { [[<leader>sH]], _map('telescope.actions.pick.highlight'), desc = 'Highlights' },

    { [[<leader>sl]], _map('telescope.actions.pick.line.buffer'), desc = 'Buffer Lines' },
    { [[<leader>s']], _map('telescope.actions.pick.mark'), desc = 'Marks' },
    { [[<leader>so]], _map('telescope.actions.pick.file.recent'), desc = 'Recent Files' },
    { [[<leader>sy]], _map('telescope.actions.pick.icon'), desc = 'Character Symbols' },
    { [[<leader>ss]], _map('telescope.actions.pick.tagstack'), desc = 'Tag Stack' },
    { [[<leader>sv]], _map('telescope.actions.pick.vim.option'), desc = 'Vim Options' },
  },
})
