-- lua/layers/ide/lsp/init.lua

return {
  my.layer 'ide.lsp.core',

  -- MASIN/LSP server autoinstall
  my.layer 'ide.lsp.install',

  -- LSP Trouble
  my.layer 'ide.lsp.trouble',

  -- SIGNATURE
  my.layer 'ide.lsp.signature',

  -- LSP Dressing (UI improvements)
  my.layer 'ide.lsp.dressing',

  -- LIGHTBULB
  -- shows a lightbulb in the gutter when there is an action to fix a diagnostic
  my.layer 'ide.lsp.lightbulb',

  -- use lsp for folding
  -- NOTE: using tsitter folding instead
  -- my.layer 'ide.lsp.folding',
}
