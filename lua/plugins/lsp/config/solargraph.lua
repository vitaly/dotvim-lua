return {

  -- cmd = { 'binx', 'solargraph', 'stdio' },
  settings = {
    solargraph = {
      useBundler = true,
      trace = {
        server = 'verbose',
      },
      logLevel = 'debug',
    },
  },
  flags = { debounce_text_changes = 150 },
}
