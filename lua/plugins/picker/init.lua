local glue_map = require('lib.glue').map

return require('lib.tools').vplug({
  'plugins.picker',

  dependencies = {
    'nvim-telescope/telescope.nvim', -- https://github.com/nvim-telescope/telescope.nvim
    'folke/snacks.nvim', -- https://github.com/folke/snacks.nvim
  },

  keys = {
    { [[<localleader><localleader>]], glue_map('picker', 'snacks.actions.pick.file'), desc = 'Find File' },

    { [[<leader>/]], glue_map('picker', 'snacks.actions.grep'), desc = 'Grep in Files' },
    { [[<leader><cr>]], glue_map('picker', 'snacks.actions.pick.command'), desc = 'Find Command' },
    { [[<leader>:]], glue_map('picker', 'snacks.actions.pick.history.command'), desc = 'Search Command History' },

    { [[??]], glue_map('picker', 'snacks.actions.pick.help'), desc = 'Find Help' },
    { [[?k]], glue_map('picker', 'snacks.actions.pick.keymap'), desc = 'Find Keymaps' },
    { [[?m]], glue_map('picker', 'telescope.actions.pick.man'), desc = 'Man Pages' },

    { [[<leader>ff]], glue_map('picker', 'telescope.actions.pick.file'), desc = 'Find File' },
    { [[<leader>bb]], glue_map('picker', 'snacks.actions.pick.buffer'), desc = 'Find buffer' },

    { [[<leader>sd]], glue_map('picker', 'snacks.actions.pick.diagnostic.buffer'), desc = 'Buffer Diagnostics' },
    { [[<leader>sD]], glue_map('picker', 'snacks.actions.pick.diagnostic'), desc = 'Diagnostics' },
    { [[<leader>sw]], glue_map('picker', 'snacks.actions.grep.word'), desc = 'Search Word' },
    { [[<leader>st]], glue_map('picker', 'snacks.actions.pick.todo'), desc = 'Search TODOs' },
    { [[<leader>sp]], glue_map('picker', 'snacks.actions.pick.project'), desc = 'Find Project' },
  },
})
