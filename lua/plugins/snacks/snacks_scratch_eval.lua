local M = {}

local ns = vim.api.nvim_create_namespace('snacks_scratch_eval')

local function get_code(buf)
  local mode = vim.fn.mode()

  if mode:find('[vV]') then
    if mode == 'v' then
      vim.cmd('normal! v')
    elseif mode == 'V' then
      vim.cmd('normal! V')
    end

    local from = vim.api.nvim_buf_get_mark(buf, '<')
    local to = vim.api.nvim_buf_get_mark(buf, '>')

    vim.fn.feedkeys('gv', 'nx')

    return vim.api.nvim_buf_get_lines(buf, from[1] - 1, to[1], false), to[1] - 1
  end

  local lines = vim.api.nvim_buf_get_lines(buf, 0, -1, false)
  return lines, math.max(#lines - 1, 0)
end

local function get_range(buf)
  local mode = vim.fn.mode()

  if mode:find('[vV]') then
    local from = vim.api.nvim_buf_get_mark(buf, '<')
    local to = vim.api.nvim_buf_get_mark(buf, '>')

    local start_line = from[1] - 1
    local end_line = to[1]

    local lines = vim.api.nvim_buf_get_lines(buf, start_line, end_line, false)
    return lines, start_line
  end

  local lines = vim.api.nvim_buf_get_lines(buf, 0, -1, false)
  return lines, 0
end

local function clear(buf)
  vim.diagnostic.reset(ns, buf)
  vim.api.nvim_buf_clear_namespace(buf, ns, 0, -1)
end

local function render(buf, items)
  clear(buf)

  for _, item in ipairs(items) do
    local lnum = item.line - 1
    local hl = item.kind == 'error' and 'DiagnosticError' or 'Comment'

    local chunks = {}
    for _, line in ipairs(vim.split(item.text, '\n', { plain = true })) do
      if line ~= '' then table.insert(chunks, {
        { ' │ ' .. line, hl },
      }) end
    end

    if #chunks > 0 then vim.api.nvim_buf_set_extmark(buf, ns, lnum, 0, {
      virt_lines = chunks,
    }) end

    if item.kind == 'error' then
      vim.diagnostic.set(ns, buf, {
        {
          lnum = lnum,
          col = 0,
          severity = vim.diagnostic.severity.ERROR,
          message = item.text,
        },
      })
    end
  end
end

local function parse_json_lines(stdout)
  local items = {}

  for line in stdout:gmatch('[^\r\n]+') do
    local ok, decoded = pcall(vim.json.decode, line)
    if ok and decoded and decoded.line and decoded.text then table.insert(items, decoded) end
  end

  return items
end

function M.ruby(self)
  local buf = self.buf
  local lines, offset = get_range(buf)

  clear(buf)

  local payload = vim.json.encode({
    lines = lines,
    offset = offset,
  })

  local ruby = [[
require "json"
require "stringio"

payload = JSON.parse(STDIN.read)
lines = payload["lines"]
offset = payload["offset"]

b = binding

def emit(line, kind, text)
  puts({
    line: line,
    kind: kind,
    text: text.to_s
  }.to_json)
end

lines.each_with_index do |code, i|
  line_no = offset + i + 1
  next if code.strip.empty? || code.strip.start_with?("#")

  old_stdout = $stdout
  capture = StringIO.new

  begin
    $stdout = capture
    value = eval(code, b)
    $stdout = old_stdout

    out = capture.string
    emit(line_no, "out", out.chomp) unless out.empty?
    emit(line_no, "result", "=> #{value.inspect}") unless value.nil?
  rescue Exception => e
    $stdout = old_stdout
    emit(line_no, "error", "#{e.class}: #{e.message}")
  end
end
]]

  vim.system({ 'ruby', '-e', ruby }, {
    stdin = payload,
    text = true,
  }, function(res)
    vim.schedule(function()
      render(buf, parse_json_lines(res.stdout or ''))

      if res.stderr and res.stderr ~= '' then
        render(buf, {
          {
            line = 1,
            kind = 'error',
            text = res.stderr,
          },
        })
      end
    end)
  end)
end

function M.bun_js(self)
  local buf = self.buf
  local lines, offset = get_range(buf)

  clear(buf)

  local payload = vim.json.encode({
    lines = lines,
    offset = offset,
  })

  local tmp = vim.fn.tempname() .. '.mjs'

  local js = [[
import vm from "node:vm"
import { inspect } from "node:util"

const payload = JSON.parse(await Bun.stdin.text())
const lines = payload.lines
const offset = payload.offset

const ctx = vm.createContext({})

ctx.__snacks_logs = []
ctx.console = {
  log: (...args) => {
    ctx.__snacks_logs.push(args.map(format).join(" "))
  },
  error: (...args) => {
    ctx.__snacks_logs.push(args.map(format).join(" "))
  },
  warn: (...args) => {
    ctx.__snacks_logs.push(args.map(format).join(" "))
  },
}

function format(value) {
  return inspect(value, {
    depth: 6,
    colors: false,
    compact: false,
  })
}

function emit(line, kind, text) {
  console.log(JSON.stringify({ line, kind, text: String(text) }))
}

for (let i = 0; i < lines.length; i++) {
  const code = lines[i]
  const lineNo = offset + i + 1

  if (!code.trim() || code.trim().startsWith("//")) continue

  ctx.__snacks_logs = []

  try {
    const result = vm.runInContext(code, ctx)

    if (ctx.__snacks_logs.length > 0) {
      emit(lineNo, "out", ctx.__snacks_logs.join("\n"))
    }

    if (result !== undefined) {
      emit(lineNo, "result", "=> " + format(result))
    }
  } catch (error) {
    emit(lineNo, "error", error.name + ": " + error.message)
  }
}
]]

  vim.fn.writefile(vim.split(js, '\n', { plain = true }), tmp)

  vim.system({ 'bun', 'run', tmp }, {
    stdin = payload,
    text = true,
  }, function(res)
    vim.schedule(function()
      pcall(vim.fn.delete, tmp)

      render(buf, parse_json_lines(res.stdout or ''))

      if res.stderr and res.stderr ~= '' then
        render(buf, {
          {
            line = 1,
            kind = 'error',
            text = res.stderr,
          },
        })
      end
    end)
  end)
end

function M.run_scratch(self, cmd)
  my.log.debug('Running scratch with command:', cmd)
  local buf = self.buf

  vim.diagnostic.reset(ns, buf)
  vim.api.nvim_buf_clear_namespace(buf, ns, 0, -1)

  local lines, output_line = get_code(buf)
  local code = table.concat(lines, '\n')

  vim.system(cmd, {
    stdin = code,
    text = true,
  }, function(res)
    vim.schedule(function()
      local out = vim.trim((res.stdout or '') .. '\n' .. (res.stderr or ''))

      if out == '' then out = '✓ ok' end

      local virt_lines = {}
      for _, line in ipairs(vim.split(out, '\n', { plain = true })) do
        table.insert(virt_lines, {
          { ' │ ', 'Comment' },
          { line, res.code == 0 and 'Comment' or 'DiagnosticError' },
        })
      end

      vim.api.nvim_buf_set_extmark(buf, ns, output_line, 0, {
        virt_lines = virt_lines,
      })

      if res.code ~= 0 then
        vim.diagnostic.set(ns, buf, {
          {
            lnum = output_line,
            col = 0,
            severity = vim.diagnostic.severity.ERROR,
            message = out,
          },
        })
      end
    end)
  end)
end

return M
