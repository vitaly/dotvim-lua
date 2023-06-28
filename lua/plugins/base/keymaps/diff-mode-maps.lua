return {
  setup = function()
    -- add diffmode keymaps
    local diff_mode = function()
      vim.keymap.set('n', ',dp', '<cmd>diffput<cr>', { buffer = 0, silent = true, desc = 'Diff Put' })
      vim.keymap.set('n', ',dg', '<cmd>diffget<cr>', { buffer = 0, silent = true, desc = 'Diff Get' })
      vim.keymap.set('n', ',dn', ']c', { buffer = 0, silent = true, desc = 'Next Diff' })
      vim.keymap.set('n', ',dN', '[c', { buffer = 0, silent = true, desc = 'Prev Diff' })

      if not vim.o.diff then
        vim.keymap.del('n', ',dp', { buffer = 0 })
        vim.keymap.del('n', ',dg', { buffer = 0 })
        vim.keymap.del('n', ',dn', { buffer = 0 })
        vim.keymap.del('n', ',dN', { buffer = 0 })
      end
    end

    require('lib.au').command('diffmode.maps', 'OptionSet', diff_mode, { pattern = 'diff' })
    diff_mode() -- need to call it on startup becase OptionSet isn't called when vim starts in diffmode
  end,
}
