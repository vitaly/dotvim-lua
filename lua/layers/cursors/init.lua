return {
  'mg979/vim-visual-multi', -- https://github.com/mg979/vim-visual-multi

  setup = function()
    vim.g.VM_leader = '<localleader>v'
    require('which-key').register {
      ['<localleader>v'] = {
        name = 'Visual Multi',
      },
    }
  end,
  config = function()
    vim.g.VM_highlight_matches = 'red'
  end,
}
