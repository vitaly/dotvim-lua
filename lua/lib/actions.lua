local ACTIONS = {}

function ACTIONS.register(name, actions)
  local glue = require('glue').register(name)
  actions = actions or {}

  local M = {}

  M.actions = actions

  function M.stop() glue.clear('*') end

  function M.start()
    M.stop()
    for event, fn in pairs(actions or {}) do
      glue.handle(event, fn)
    end
  end

  return M
end

return ACTIONS
