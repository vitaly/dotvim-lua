return function (use)
  use {
    'kyazdani42/nvim-tree.lua', -- https://github.com/kyazdani42/nvim-tree.lua
    requires = 'kyazdani42/nvim-web-devicons',
    setup = function ()
      local vimp = require('vimp')
      local noremap = vimp.noremap
      noremap('<plug>File-Tree(toggle)',     '<cmd>NvimTreeToggle<cr>')
      noremap('<plug>File-Tree(reveal)',     '<cmd>lua require"nvim-tree".find_file(true)<cr>')

      local nmap = vimp.nmap
      nmap('<leader>,', '<plug>File-Tree(toggle)')
      nmap('<leader>0', '<plug>File-Tree(reveal)')

      vim.g.nvim_tree_git_hl = 1
      vim.g.nvim_tree_indent_markers = 1
      vim.g.nvim_tree_create_in_closed_folder = 1
      -- vim.g.nvim_tree_disable_window_picker = 1

      vim.g.nvim_tree_icons = {
      default = '',
      symlink =  '',
      }
    end,
    config = function()
      require'nvim-tree'.setup {
        update_cwd = true,
        update_focused_file = { enable = true, },
      }
    end,
    -- cmd = { "NvimTreeToggle", "NvimTreeFocus" },
    -- keys = { '<leader>,' },
  }
end




-- local present, nvimtree = pcall(require, "nvim-tree")

-- if not present then
--    return
-- end

-- vim.o.termguicolors = true

-- vim.cmd [[highlight NvimTreeNormal guifg=#D8DEE9  guibg=#2a2e39]]

-- vim.g.nvim_tree_add_trailing = 0 -- append a trailing slash to folder names
-- vim.g.nvim_tree_highlight_opened_files = 0
-- vim.g.nvim_tree_indent_markers = 1
-- vim.g.nvim_tree_ignore = { ".git", "node_modules", ".cache" }
-- vim.g.nvim_tree_quit_on_open = 0 -- closes tree when file's opened
-- vim.g.nvim_tree_root_folder_modifier = table.concat { ":t:gs?$?/..", string.rep(" ", 1000), "?:gs?^??" }
-- --
-- vim.g.nvim_tree_show_icons = {
--    folders = 1,
--    files = 1,
-- }

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

-- nvimtree.setup {
--    filters = {
--       dotfiles = false,
--    },
--    disable_netrw = true,
--    hijack_netrw = true,
--    ignore_ft_on_setup = { "dashboard" },
--    auto_close = false,
--    open_on_tab = false,
--    hijack_cursor = true,
--    update_cwd = true,
--    update_focused_file = {
--       enable = true,
--       update_cwd = true,
--    },
--    view = {
--       allow_resize = true,
--       side = "left",
--       width = 30,
--    },
-- }
--
--
--
--
--
--
--
-- Plug 'kyazdani42/nvim-web-devicons' " for file icons
-- Plug 'kyazdani42/nvim-tree.lua'
-- fu! s:nvim_tree_setup()
--   lua <<LUA
--   local tree_cb = require'nvim-tree.config'.nvim_tree_callback
--   vim.g.nvim_tree_bindings = {
--     { key = {"<CR>", "<2-LeftMouse>"}, cb = tree_cb("edit") },
--     { key = {"o"}, cb = tree_cb("cd") },
--     { key = {"U"}, cb = tree_cb("dir_up") },
--     { key = {"v"}, cb = tree_cb("vsplit") },
--     { key = {"s", "i"}, cb = tree_cb("split") },
--     }
--   require'nvim-tree'.setup {
--       update_cwd          = true,
--       update_focused_file = {
--         enable            = true,
--       },

--     }
-- LUA
-- endfu
-- au VimEnter * call s:nvim_tree_setup()

-- let g:nvim_tree_side = 'right'

-- let g:nvim_tree_indent_markers = 1
-- let g:nvim_tree_git_hl = 1

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


-- nnoremap  <silent>  <plug>(LuaTree/Toggle)      :NvimTreeToggle<CR>
-- nmap                \]                          <plug>(LuaTree/Toggle)

-- nnoremap  <silent>  <plug>(LuaTree/Find-File)   :lua require'nvim-tree'.find_file(true)<CR>
-- nmap                \0                          <plug>(LuaTree/Find-File)


-- let g:nvim_tree_width_allow_resize = 0
-- let g:nvim_tree_width_max = 80
