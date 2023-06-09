-- lua/layers/ide/lsp/init.lua

return {
  _my.layer 'ide.lsp.core',
  -- MASIN/LSP server autoinstall
  _my.layer 'ide.lsp.install',
  -- LSP Trouble
  _my.layer 'ide.lsp.trouble',
  -- SIGNATURE
  _my.layer 'ide.lsp.signature',
  -- LSP Dressing (UI improvements)
  _my.layer 'ide.lsp.dressing',
  -- LIGHTBULB
  -- shows a lightbulb in the gutter when there is an action to fix a diagnostic
  _my.layer 'ide.lsp.lightbulb',

  -- use lsp for folding
  -- NOTE: using tsitter folding instead
  -- _my.layer 'ide.lsp.folding',
}
