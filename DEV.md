<!-- lua/init/DEV.md -->

## Logging

# lua/init/log.lua

`config.log_level` - minimal log level to display

`vim.log.levels`:

```lua
{
  TRACE = 0,
  DEBUG = 1,
  INFO  = 2,
  WARN  = 3
  ERROR = 4,
  OFF   = 5,
}
```

`my.log.notify(level, ...)`
`debug` -> `my.log.debug`
`trace` -> `my.log.trace`

Switch Log level via `<\\l>` map
Display messages with `<SPACE>m`

# trace

Use `_t('message')` to add `message` to the trace log `_G.__t`

Use `<space-m>t` to display trace log.


<!-- lua/plugins/statusline/DEV.md -->

## Status Line

> `lua/plugins/statusline/init.lua`

