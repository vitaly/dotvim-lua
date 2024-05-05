local config = my.config.tree or {}

if config.plugin == 'nvimtree' then
  return require 'plugins.base-tree.filer-nvimtree'
else
  return require 'plugins.base-tree.filer-neotree'
end
