return require('lib.actions').register('refactoring.actions', {
  ['refactoring.actions.select'] = function() return require('refactoring').select_refactor() end,

  ['refactoring.actions.extract.function'] = function() return require('refactoring').extract_func() end,
  ['refactoring.actions.extract.function.to_file'] = function() return require('refactoring').extract_func_to_file() end,
  ['refactoring.actions.extract.variable'] = function() return require('refactoring').extract_var() end,

  ['refactoring.actions.inline.function'] = function() return require('refactoring').inline_func() end,
  ['refactoring.actions.inline.variable'] = function() return require('refactoring').inline_var() end,
})
