return {
  setup = function()
    -- add diffmode keymaps
    local diff_mode = function()
      vim.api.nvim_buf_set_keymap(0, 'n', ',dp', '<cmd>diffput<cr>', { noremap = true, silent = true, desc = 'Diff Put' })
      vim.api.nvim_buf_set_keymap(0, 'n', ',dg', '<cmd>diffget<cr>', { noremap = true, silent = true, desc = 'Diff Get' })
      vim.api.nvim_buf_set_keymap(0, 'n', ',dn', ']c', { noremap = true, silent = true, desc = 'Next Diff' })
      vim.api.nvim_buf_set_keymap(0, 'n', ',dN', '[c', { noremap = true, silent = true, desc = 'Prev Diff' })
      if not vim.o.diff then
        vim.api.nvim_buf_del_keymap(0, 'n', ',dp')
        vim.api.nvim_buf_del_keymap(0, 'n', ',dg')
        vim.api.nvim_buf_del_keymap(0, 'n', ',dn')
        vim.api.nvim_buf_del_keymap(0, 'n', ',dN')
      end
    end

    require('lib.au').command('diffmode.maps', 'OptionSet', diff_mode, { pattern = 'diff' })
    diff_mode() -- need to call it on startup becase OptionSet isn't called when vim starts in diffmode
  end,
}
