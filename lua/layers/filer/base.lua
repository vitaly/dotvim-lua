return {
  setup = function()
    local which_key = require 'which-key'

    local toggle_tree = '<plug>File-Tree(toggle)'
    local reveal_file = '<plug>File-Tree(reveal)'


    which_key.register({
      ['\\'] = {
        ['\\'] =  { toggle_tree, 'Toggle File Tree' },
        ['['] = { reveal_file, 'Reveal file' },
      }
    })
  end
}
