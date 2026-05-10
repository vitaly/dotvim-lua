## Code Completion

### Backend

[blink.cmp](https://github.com/saghen/blink.cmp) (default) or nvim-cmp.

- `config.code-completion.backend` - 'blink' (default) or 'cmp'

### Blink.cmp (default)

[blink.cmp](https://github.com/saghen/blink.cmp) with [copilot.lua](https://github.com/zbirenbaum/copilot.lua) and [LuaSnip](https://github.com/L3MON4D3/LuaSnip).

### Keymaps

- `<Tab>` - Accept suggestion / snippet forward / copilot accept
- `<M-w>` - Accept word
- `<M-l>` - Accept line
- `<M-]>` - Next suggestion
- `<M-[>` - Prev suggestion
- `<C-]>` - Dismiss
- `<C-j>` / `<C-k>` - Select next/prev

### Snippets

[LuaSnip](https://github.com/L3MON4D3/LuaSnip) with [friendly-snippets](https://github.com/rafamadriz/friendly-snippets).

- `<Tab>` (in insert mode) - Jump to next snippet placeholder
- `<S-Tab>` - Jump to previous snippet placeholder

### Copilot

[copilot.lua](https://github.com/zbirenbaum/copilot.lua) with copilot-lsp.

- `<leader>aci` - Copilot Status
- `<leader>acp` - Copilot Panel