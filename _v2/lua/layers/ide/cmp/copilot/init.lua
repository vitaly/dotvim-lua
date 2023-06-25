return {
  'github/copilot.vim', -- https://github.com/github/copilot.vim

  setup = function()
    vim.g.copilot_no_tab_map = 1
    vim.g.copilot_assume_mapped = 1
  end,

  config = function()
    require('which-key').register {
      ['<leader>'] = {
        sg = { '<cmd>Copilot status<cr>', 'Github Copilot' },
      },
    }
  end,
}
