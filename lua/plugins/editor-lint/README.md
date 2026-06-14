# editor-lint

[nvim-lint](https://github.com/mfussenegger/nvim-lint) — async linting. Runs on `BufEnter`, `BufWritePost`, and `InsertLeave`.

Currently configured linters:

| Filetype | Linter |
|----------|--------|
| `javascript` | `eslint_d` |

## Setting up ESLint in a project

ESLint only runs when it finds a config file (`eslint.config.mjs` / `.eslintrc.*`) in the project directory or a parent. Without one, `eslint_d` silently skips the file.

```sh
npm init -y
npm install --save-dev eslint @eslint/js globals
```

Create `eslint.config.mjs`:

```js
import js from '@eslint/js';
import globals from 'globals';

export default [
  js.configs.recommended,
  {
    languageOptions: {
      globals: {
        ...globals.browser,
        ...globals.node,
      },
    },
    rules: {
      'no-unused-vars': 'warn',
      'no-undef': 'error',
    },
  },
];
```

`eslint_d` is installed via Mason (configured in `lua/plugins/lsp`).

> **Note**: to `package.json` and `eslint.config.mjs` already exit in this project. run `make install` to install `node_modules`.
