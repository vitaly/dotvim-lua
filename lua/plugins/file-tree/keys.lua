return function()
  local glue_map = require('lib.glue').map
  return {
    { '\\\\', glue_map('file-tree', 'file-tree.actions.popup'), desc = 'File Tree Popup' },
    { '\\[', glue_map('file-tree', 'file-tree.actions.toggle'), desc = 'File Tree Toggle' },
    { '\\.', glue_map('file-tree', 'file-tree.actions.reveal'), desc = 'File Tree Reveal' },
  }
end
