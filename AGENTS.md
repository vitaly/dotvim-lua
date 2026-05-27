# AGENTS.md

## Think Before Coding
Before editing, identify the goal, assumptions, and any ambiguity. Ask only when ambiguity blocks progress.

## Simplicity First
Prefer the smallest working change. Do not add abstractions, dependencies, frameworks, or configuration unless directly required.

## Surgical Changes
Change only files relevant to the task. Avoid unrelated cleanup, formatting, renaming, or refactoring.

## Goal-Driven Execution
Define what “done” means before implementation. After changes, run the most relevant checks or explain why they were not run.

## Preserve Existing Behavior
Do not change public APIs, data formats, tests, or UX behavior unless explicitly requested.

## Communicate Clearly
Summarize what changed, what was verified, and any risks or follow-up work.

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

### Structure
- `lua/init/` - Core initialization
- `lua/plugins/` - Plugin configurations by category
- `lua/lib/` - Utility libraries
- `ftplugin/` - Filetype-specific configurations
- `lsp/` - LSP configurations
