--------------------------------------------------------------------------------
--- Project-local configuration helper
--- Use in your project's .nvim.lua file:
---
---   require('plugins.testing.bats').setup({
---     executable = 'test/run',  -- custom test runner script
---     options = '',             -- override default options
---   })
---
--------------------------------------------------------------------------------
local M = {}

---@class BatsConfig
---@field executable? string Custom bats executable (e.g., 'test/run')
---@field options? string Options to pass to bats (default: '--tap')

---Configure bats test runner for the current project
---@param opts BatsConfig
function M.setup(opts)
  opts = opts or {}
  if opts.executable then vim.g['test#shell#bats#executable'] = opts.executable end
  if opts.options then vim.g['test#shell#bats#options'] = opts.options end
end

return M
