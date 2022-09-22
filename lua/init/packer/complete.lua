-- first load and initialize packer module
local packer = require 'init.plugins'

-- we want to return all completions. some of it is in the snapshot module
local snapshot = require 'packer.snapshot'

return {
  plugin_complete = packer.plugin_complete,
  loader_complete = packer.loader_complete,
  snapshot = snapshot,
}
