return {
  'wfxr/minimap.vim', -- https://github.com/wfxr/minimap.vim
  cmd = { 'Minimap', 'MinimapClose', 'MinimapToggle', 'MinimapRefresh', 'MinimapUpdateHighlight' },
  setup = function()
    -- vim.g.minimap_auto_start = 1
    -- vim.g.minimap_auto_start_win_ente = 1
    vim.g.minimap_block_filetypes = { 'fugitive', 'nerdtree', 'tagbar', 'fzf', 'Outline' }
    -- vim.g.minimap_close_filetypes = { 'startify', 'netrw', 'vim-plug', 'Outline' }

    require('which-key').register {
      ['\\'] = {
        m = { '<cmd>MinimapToggle<cr>', 'Toggle Minimap' },
      },
    }
  end,
}
