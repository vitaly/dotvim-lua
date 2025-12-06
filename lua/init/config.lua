_G.my = _G.my or {}

_G.R = function(mod)
  package.loaded[mod] = nil
  return require(mod)
end

---@diagnostic disable-next-line: param-type-mismatch
my.root = vim.uv.fs_realpath(vim.fn.stdpath('config'))
vim.g.MY_ROOT = my.root
