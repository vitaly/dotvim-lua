local function telescope(cmd)
  return '<cmd>Telescope ' .. cmd .. '<cr>'
end

--- @type MapDef[]
return {
  find_files = { telescope [[find_files]], desc = 'Find File' },

  live_grep = { telescope [[live_grep]], desc = 'Live Grep' },

  commands = { telescope [[commands]], desc = 'Find Command' },

  buffers = { telescope [[buffers]], desc = 'Find buffer' },
  help_tags = { telescope [[help_tags]], desc = 'Help Tags' },

  command_history = { telescope [[command_history]], desc = 'Command History' },

  telescope = { telescope [[]], desc = 'Telescope' },
  colorschemes = { telescope [[colorscheme enable_preview=true]], desc = 'Colorscheme +preview' },
  highlights = { telescope [[highlights]], desc = 'Highlights' },

  diagnostics = { telescope [[diagnostics]], desc = 'Diagnostics' },
  autocommands = { telescope [[autocommands]], desc = 'Autocommands' },
  buf_diagnostics = { telescope [[diagnostics buffnr=0]], desc = 'Document Diagnostics' },
  grep_string = { telescope [[grep_string]], desc = 'Grep String' },
  keymaps = { telescope [[keymaps]], desc = 'Keymaps' },
  lines = { telescope [[current_buffer_fuzzy_find]], desc = 'Current Buffer Lines' },
  man_pages = { telescope [[man_pages]], desc = 'Manpages' },
  recent_fies = { telescope [[oldfiles]], desc = 'Recent Files' },
  symbols = { telescope [[symbols]], desc = 'Character S[y]mbols' },
  tagstack = { telescope [[tagstack]], desc = 'Tag[s]tack' },
  vim_options = { telescope [[vim_options]], desc = 'Vim Options' },

  marks = { telescope [[marks]], desc = 'Marks' },

  git_files = { telescope [[git_files]], desc = 'Git Files' },
  git_commits = { telescope [[git_commits]], desc = 'Git Commits' },
  git_status = { telescope [[git_status]], desc = 'Search Git Status' },
}
