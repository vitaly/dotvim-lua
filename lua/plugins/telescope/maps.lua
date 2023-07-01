local function telescope(cmd)
  return '<cmd>Telescope ' .. cmd .. '<cr>'
end

--- @type KeyDef[]
local maps = {
  find_files = { nil, telescope [[find_files]], desc = 'Find File' },

  live_grep = { nil, telescope [[live_grep]], desc = 'Live Grep' },

  commands = { nil, telescope [[commands]], desc = 'Find Command' },

  buffers = { nil, telescope [[buffers]], desc = 'Find buffer' },
  help_tags = { nil, telescope [[help_tags]], desc = 'Help Tags' },

  command_history = { nil, telescope [[command_history]], desc = 'Command History' },

  telescope = { nil, telescope [[]], desc = 'Telescope' },
  colorschemes = { nil, telescope [[colorscheme enable_preview=true]], desc = 'Colorscheme +preview' },
  highlights = { nil, telescope [[highlights]], desc = 'Highlights' },

  diagnostics = { nil, telescope [[diagnostics]], desc = 'Diagnostics' },
  autocommands = { nil, telescope [[autocommands]], desc = 'Autocommands' },
  buf_diagnostics = { nil, telescope [[diagnostics buffnr=0]], desc = 'Document Diagnostics' },
  grep_string = { nil, telescope [[grep_string]], desc = 'Grep String' },
  keymaps = { nil, telescope [[keymaps]], desc = 'Keymaps' },
  lines = { nil, telescope [[current_buffer_fuzzy_find]], desc = 'Current Buffer Lines' },
  man_pages = { nil, telescope [[man_pages]], desc = 'Manpages' },
  recent_fies = { nil, telescope [[oldfiles]], desc = 'Recent Files' },
  symbols = { nil, telescope [[symbols]], desc = 'Character S[y]mbols' },
  tagstack = { nil, telescope [[tagstack]], desc = 'Tag[s]tack' },
  vim_options = { nil, telescope [[vim_options]], desc = 'Vim Options' },

  marks = { nil, telescope [[marks]], desc = 'Marks' },

  git_files = { nil, telescope [[git_files]], desc = 'Git Files' },
  git_commits = { nil, telescope [[git_commits]], desc = 'Git Commits' },
  git_status = { nil, telescope [[git_status]], desc = 'Search Git Status' },
}
return maps
