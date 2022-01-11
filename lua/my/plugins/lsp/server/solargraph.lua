return {
  setup = function(defaults)
    local config = vim.tbl_extend('force', defaults, {
      cmd = { 'binx', 'solargraph', 'stdio' },
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
    })

    require('lspconfig').solargraph.setup(config)
  end,
}
