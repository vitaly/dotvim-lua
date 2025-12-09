# AGENTS.md

## Build/Lint/Test Commands

- do NOT run tests and builds

## Code Style Guidelines

### Lua Formatting (.stylua.toml)
- 2-space indentation
- 150 character line width
- Single quotes preferred (AutoPreferSingle)
- Always use parentheses for function calls
- Collapse simple statements always
- Sort require statements automatically

### Code Conventions
- Modular plugin architecture in `lua/plugins/`
- Each plugin has `init.lua` and optional `README.md`/`DEV.md`
- Use Lazy.nvim for plugin management
- Configuration via onion.nvim with auto-save
- Comprehensive logging with `<\l>` to toggle levels
- Document development plugins with `dev = true`

### Structure
- `lua/init/` - Core initialization
- `lua/plugins/` - Plugin configurations by category
- `lua/lib/` - Utility libraries
- `ftplugin/` - Filetype-specific configurations
- `lsp/` - LSP configurations
