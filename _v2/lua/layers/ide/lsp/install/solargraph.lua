return {
  setup = function(defaults)
    require('lspconfig').solargraph.setup(vim.tbl_deep_extend('force', defaults, {

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
    }))
  end,
}
