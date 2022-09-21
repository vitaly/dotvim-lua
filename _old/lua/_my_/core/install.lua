


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

