-- local debug = my.log.debug
return {
  {
    'nvim-treesitter/nvim-treesitter', -- https://github.com/nvim-treesitter/nvim-treesitter

    branch = 'main',

    dependencies = {
      'mason-org/mason.nvim',
      'RRethy/nvim-treesitter-endwise', -- https://github.com/RRethy/nvim-treesitter-endwise
    },

    build = ':TSUpdate',

    lazy = false,

    cmd = { 'TSInstall', 'TSInstalFromGrammar', 'TSUpdate', 'TSUninstall', 'TSLog' },

    keys = {
      { '<leader>aTu', '<cmd>TSUpdate<cr>', desc = 'Update' },
      { '<leader>aTh', '<cmd>checkhealth vim.treesitter<cr>', desc = 'vim.treesitter health' },
      { '<leader>aTH', '<cmd>checkhealth nvim-treesitter<cr>', desc = 'nvim-treesitter health' },
      {
        '<leader>aTt',
        function()
          local buf = vim.api.nvim_get_current_buf()
          if vim.treesitter.highlighter.active[buf] then
            vim.treesitter.stop(buf)
            vim.notify('Treesitter: off', vim.log.levels.INFO)
          else
            local ok, err = pcall(vim.treesitter.start, buf)
            if ok then
              vim.notify('Treesitter: on', vim.log.levels.INFO)
            else
              vim.notify('Treesitter start failed: ' .. tostring(err), vim.log.levels.ERROR)
            end
          end
        end,
        desc = 'Toggle',
      },
    },

    init = function()
      require('which-key').add({
        { [[<leader>aT]], group = 'Tree Sitter' },
      })
    end,

    config = function()
      require('nvim-treesitter').install({
        'bash',
        'c',
        'comment',
        'cpp',
        'css',
        'elixir',
        'go',
        'html',
        'javascript',
        'jsdoc',
        'json',
        'latex',
        'lua',
        'make',
        'markdown_inline',
        'markdown',
        'python',
        'query',
        'regex',
        'ruby',
        'rust',
        'scala',
        'scss',
        'toml',
        'typescript',
        'vim',
        'yaml',
      })
    end,
  },
}
