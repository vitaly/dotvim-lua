return require('lib.actions').register('refactoring.actions', {
  ['refactoring.actions.select'] = function() return require('refactoring').select_refactor() end,
  ['refactoring.actions.telescope'] = function() return require('telescope').extensions.refactoring.refactors() end,

  ['refactoring.actions.extract.function'] = function() return require('refactoring').refactor('Extract Function') end,
  ['refactoring.actions.extract.function.to_file'] = function() return require('refactoring').refactor('Extract Function To File') end,
  ['refactoring.actions.extract.variable'] = function() return require('refactoring').refactor('Extract Variable') end,
  ['refactoring.actions.extract.block'] = function() return require('refactoring').refactor('Extract Block') end,
  ['refactoring.actions.extract.block.to_file'] = function() return require('refactoring').refactor('Extract Block To File') end,

  ['refactoring.actions.inline.function'] = function() return require('refactoring').refactor('Inline Function') end,
  ['refactoring.actions.inline.variable'] = function() return require('refactoring').refactor('Inline Variable') end,
})
