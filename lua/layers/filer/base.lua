return {
  setup = function()
    local which_key = require 'which-key'

    local toggle_tree = '<plug>File-Tree(toggle)'
    local reveal_file = '<plug>File-Tree(reveal)'


    which_key.register({
      ['<leader>'] = {
        [','] =  { toggle_tree, 'Toggle File Tree' },
        ['0'] = { reveal_file, 'Reveal file' },

        f = {
          r = { reveal_file, 'Reveal' },
        },

      },

      ['\\'] = {
        ['\\'] =  { toggle_tree, 'Toggle File Tree' },
      }
    })
  end
}
