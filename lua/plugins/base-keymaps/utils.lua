local UTIL = {}

---------------------------------------------------------------------------------
-- redraw
---------------------------------------------------------------------------------
function UTIL.redraw()
  vim.cmd [[redraw]]
end

---------------------------------------------------------------------------------
-- toggles
local toggle = require 'lib.toggle'
UTIL.toggle_concealcursor = toggle.toggler('o:concealcursor', { 'n', '' }, UTIL.redraw)
UTIL.toggle_conceallevel = toggle.toggler('o:conceallevel', { 0, 1, 2 }, UTIL.redraw)
UTIL.toggle_clipboard = toggle.toggler('o:clipboard', { 'unnamedplus', '' }, UTIL.redraw)
UTIL.toggle_foldcolumn = toggle.toggler('o:foldcolumn', { 'auto', '0' }, UTIL.redraw)

---------------------------------------------------------------------------------
-- toggle verbose log
function UTIL.toggle_verboselog()
  if vim.o.verbose == 0 then
    vim.o.verbose = 9
    vim.o.verbosefile = './vim.log'
    print('verbose on into "' .. vim.o.verbosefile .. '"')
  else
    vim.o.verbose = 0
    vim.o.verbosefile = ''
    print 'verbose off'
  end
  UTIL.redraw()
end

---------------------------------------------------------------------------------
-- find next line with equal (or lower) indent level
---------------------------------------------------------------------------------
function UTIL.next_indent(exclusive, fwd, lowerlevel, skipblanks)
  local line = vim.fn.line '.'
  local column = vim.fn.col '.'
  local lastline = vim.fn.line '$'
  local indent = vim.fn.indent(line)
  local stepvalue = fwd and 1 or -1
  while line > 0 and line <= lastline do
    line = line + stepvalue
    if (not lowerlevel and vim.fn.indent(line) == indent) or (lowerlevel and vim.fn.indent(line) < indent) then
      if not skipblanks or #vim.fn.getline(line) > 0 then
        if exclusive then
          line = line - stepvalue
        end
        vim.notify('line: ' .. line .. ' column: ' .. column)
        vim.cmd('' .. line)
        vim.cmd 'normal ^'
        return
      end
    end
  end
end

return UTIL
