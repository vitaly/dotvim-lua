print "this is lua/foo.lua"


-- vim.api.nvim_create_autocmd('BufWritePost', {
--   group = vim.api.nvim_create_augroup('foo_test', { clear = true }),
--   pattern = "lua/test/foo.lua",
--   callback = function(args)
--     PRINT("in callback", args)
--   end,
-- })



local packer_refresh = vim.api.nvim_create_augroup('packer_refresh', { clear = true })

vim.api.nvim_create_autocmd('BufWritePost', {
  group = packer_refresh,
  pattern =  { '*/lua/init/plugins.lua', '*/lua/layers/*.lua' },
  -- pattern =  { '*/lua/init/foo.lua' },
  callback = function(args)
    PRINT("packer refresh", args)

    -- local path = string.sub(args.match. 

  end,
})
