local M = {}

---@param ns string   glue context name (e.g. 'file-tree', 'snacks')
---@param event string event channel to call (e.g. 'file-tree.actions.toggle')
function M.map(ns, event)
  local glue = require('glue').register(ns)
  return function() return glue.call(event) end
end

return M
