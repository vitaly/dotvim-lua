local function tig()
  require('toggleterm.terminal').Terminal:new({ cmd = 'tig', direction = 'float' }):toggle()
end

local function lazygit()
  require('toggleterm.terminal').Terminal:new({ cmd = 'lazygit', direction = 'float' }):toggle()
end

return {
  {
    -- NOTE: using my own version with mappings changed from C-* to M-*
    'vitaly/vim-tmux-navigator', -- https://github.com/christoomey/vim-tmux-navigator

    cmd = { 'TmuxNavigateUp', 'TmuxNavigateDown', 'TmuxNavigateLeft', 'TmuxNavigateRight' },

    keys = {
      -- those are defined by the plugin
      { '<m-k>' },
      { '<m-j>' },
      { '<m-h>' },
      { '<m-l>' },

      -- inside terminal
      { '<m-k>', vim.cmd.TmuxNavigateUp, mode = 't', silent = true },
      { '<m-j>', vim.cmd.TmuxNavigateDown, mode = 't', silent = true },
      { '<m-h>', vim.cmd.TmuxNavigateLeft, mode = 't', silent = true },
      { '<m-l>', vim.cmd.TmuxNavigateRight, mode = 't', silent = true },

      -- normal mode
      { '<m-k>', vim.cmd.TmuxNavigateUp, mode = 'c', silent = true },
      { '<m-j>', vim.cmd.TmuxNavigateDown, mode = 'c', silent = true },
      { '<m-h>', vim.cmd.TmuxNavigateLeft, mode = 'c', silent = true },
      { '<m-l>', vim.cmd.TmuxNavigateRight, mode = 'c', silent = true },

      -- command mode
      { '<leader>wk', vim.cmd.TmuxNavigateUp, silent = true, desc = 'Navigate Up' },
      { '<leader>wj', vim.cmd.TmuxNavigateDown, silent = true, desc = 'Navigate Down' },
      { '<leader>wh', vim.cmd.TmuxNavigateLeft, silent = true, desc = 'Navigate Left' },
      { '<leader>wl', vim.cmd.TmuxNavigateRight, silent = true, desc = 'Navigate Right' },
    },
  },
  {
    'akinsho/toggleterm.nvim', -- https://github.com/akinsho/toggleterm.nvim

    -- need to have navigator loaded. otherwise lazy's key stubs dump some junk characters into terminal
    dependencies = { 'vitaly/vim-tmux-navigator' },

    version = '*',

    keys = {
      { [[<c-\>]] },
      { [[<a-[>]], [[<c-\><c-n>]], mode = 't', desc = 'Switch To Normal Mode ' },
      { [[<leader>gt]], tig, desc = 'TIG' },
      { [[<leader>gl]], lazygit, desc = 'LazyGit' },
    },

    cmd = { 'TermSelect', 'TermExec', 'ToggleTerm', 'ToggleTermToggleAll' },

    opts = {
      open_mapping = [[<c-\>]],

      size = function(term)
        if term.direction == 'horizontal' then
          return 25
        elseif term.direction == 'vertical' then
          return vim.o.columns * 0.4
        end
      end,
    },

    init = function()
      -- Set terminal cursor color
      vim.api.nvim_set_hl(0, 'TermCursor', { ctermfg = 'red', fg = 'red' })

      local au = require('lib.au')

      -- For some reason clicking in a terminal buffer exits insert mode
      -- This mapping re-enters insert mode after mouse click
      au.command('terminal.mouse_click', 'TermOpen', function()
        vim.keymap.set('n', '<LeftRelease>', '<LeftRelease>i', { buffer = true, silent = true })
      end)

      -- Start in insert mode when entering terminal buffers
      au.command('terminal.insert_mode', { 'TermOpen', 'BufEnter', 'FocusGained' }, function()
        if vim.bo.buftype == 'terminal' then
          vim.cmd.startinsert()
        end
      end, { pattern = 'term://*' })
    end,
  },
}
