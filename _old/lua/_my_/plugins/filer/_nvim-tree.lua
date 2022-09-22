-- vim.cmd [[highlight NvimTreeNormal guifg=#D8DEE9  guibg=#2a2e39]]

-- vim.g.nvim_tree_ignore = { ".git", "node_modules", ".cache" }

-- vim.g.nvim_tree_icons = {
--    default = "",
--    symlink = "",
--    git = {
--       deleted = "",
--       ignored = "◌",
--       renamed = "➜",
--       staged = "✓",
--       unmered = "",
--       unstaged = "✗",
--       untracked = "★",
--    },
--    folder = {
--       -- disable indent_markers option to get arrows working or if you want both arrows and indent then just add the arrow icons in front            ofthe default and opened folders below!
--       -- arrow_open = "",
--       -- arrow_closed = "",
--       default = "",
--       empty = "", -- 
--       empty_open = "",
--       open = "",
--       symlink = "",
--       symlink_open = "",
--    },
-- }

-- let g:nvim_tree_icons = {
--       \ 'default': '',
--       \ 'symlink': ''
--       \ }

-- function! s:toggleZoom()
--   if exists('b:NvimTreeZoomed') && b:NvimTreeZoomed
--     exec "silent vertical resize " . get(g:, 'nvim_tree_width', 30)
--     let b:NvimTreeZoomed = 0
--   else
--     exec 'vertical resize '. get(g:, 'nvim_tree_width_max', '')
--     let b:NvimTreeZoomed = 1
--   endif
-- endfunction

-- autocmd FileType NvimTree call s:nvim_tree_settings()

-- function! s:nvim_tree_settings() abort

--   nnoremap <buffer>     q       :NvimTreeClose<CR>
--   nnoremap <buffer>     A       :call <SID>toggleZoom()<CR>

--   " highlight NvimTreeFolderIcon guifg=yellow
-- endfunction
