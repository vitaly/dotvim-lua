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
    { [[<localleader><localleader>]], _map('snacks.actions.pick.file'), desc = 'Find File' },

    { [[<leader>/]], _map('snacks.actions.grep'), desc = 'Grep in Files' },
    { [[<leader><cr>]], _map('snacks.actions.pick.command'), desc = 'Find Command' },
    { [[<leader>:]], _map('snacks.actions.pick.history.command'), desc = 'Search Command History' },

    { [[??]], _map('snacks.actions.pick.help'), desc = 'Find Help' },
    { [[?k]], _map('snacks.actions.pick.keymap'), desc = 'Find Keymaps' },
    { [[?m]], _map('telescope.actions.pick.man'), desc = 'Man Pages' },

    { [[<leader>ff]], _map('telescope.actions.pick.file'), desc = 'Find File' },
    { [[<leader>bb]], _map('snacks.actions.pick.buffer'), desc = 'Find buffer' },

    { [[<leader>sd]], _map('snacks.actions.pick.diagnostic.buffer'), desc = 'Buffer Diagnostics' },
    { [[<leader>sD]], _map('snacks.actions.pick.diagnostic'), desc = 'Diagnostics' },
    { [[<leader>sw]], _map('snacks.actions.grep.word'), desc = 'Search Word' },
    { [[<leader>st]], _map('snacks.actions.pick.todo'), desc = 'Search TODOs' },
    { [[<leader>sp]], _map('snacks.actions.pick.project'), desc = 'Find Project' },
  },
})
