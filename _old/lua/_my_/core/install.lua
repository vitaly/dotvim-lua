


--------------------------------------------------------------------------------
-- sync packer if plugins.lua changes
--------------------------------------------------------------------------------
vim.cmd [[
  augroup packer_plugins
    autocmd!
    autocmd BufWritePost */my/plugins.lua PackerRefresh
    autocmd BufWritePost */my/plugins/*.lua PackerRefresh
    autocmd User PackerComplete PackerCompile
    autocmd User PackerCompileDone checktime
  augroup end
]]

--------------------------------------------------------------------------------
-- setup packer commands
--------------------------------------------------------------------------------
vim.cmd "command! PackerRefresh lua REQUIRE('my.plugins').refresh()"

-- copied from packer.nvim replacing require 'packer' with 'my.packer'
vim.cmd [[packadd packer.nvim | command! -nargs=* -complete=customlist,v:lua.require'my.packer'.plugin_complete  PackerInstall    lua require('my.packer').install(<f-args>)]]
vim.cmd [[packadd packer.nvim | command! -nargs=* -complete=customlist,v:lua.require'my.packer'.plugin_complete PackerUpdate      lua require('my.packer').update(<f-args>)]]
vim.cmd [[packadd packer.nvim | command! -nargs=* -complete=customlist,v:lua.require'my.packer'.plugin_complete PackerSync        lua require('my.packer').sync(<f-args>)]]
vim.cmd [[packadd packer.nvim | command! PackerClean                                                                              lua require('my.packer').clean()]]
vim.cmd [[packadd packer.nvim | command! -nargs=* PackerCompile                                                                   lua require('my.packer').compile(<q-args>)]]
vim.cmd [[packadd packer.nvim | command! PackerStatus                                                                             lua require('my.packer').status()]]
vim.cmd [[packadd packer.nvim | command! PackerProfile                                                                            lua require('my.packer').profile_output()]]
vim.cmd [[packadd packer.nvim | command! -bang -nargs=+ -complete=customlist,v:lua.require'my.packer'.loader_complete PackerLoad  lua require('my.packer').loader(<f-args>, '<bang>' == '!')]]
