return {
  'neovim/nvim-lspconfig', -- https://github.com/neovim/nvim-lspconfig

  opts = {
    servers = {
      solargraph = {
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
      },
    },
  },
}
