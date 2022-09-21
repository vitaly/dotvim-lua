local custom = true

local ROOT = vim.fn.stdpath('config')
local PACK = ROOT .. '/pack'
local COMPILED = ROOT .. '/plugin/packer_compiled.lua'

local function load_packer()
  print 'Loading packer.nvim'

  vim.cmd [[packadd packer.nvim]]

  local packer = require 'packer'

  local border = 'rounded'
  packer.init({
    -- TODO: place the compiled file inside 'lua' so that it's cached by 'impatient'. be sure to profile the result difference
    package_root = PACK,

    disable_commands = custom,

    profile = {
      enable = true,
      threshold = 0,
    },

    display = {
      open_fn = function()
        return require('packer.util').float { border = border }
      end,
      prompt_border = border,
    },
  })

  packer.reset()

  require('plugins').load()

  return packer
end

-- TODO: figure out how to re-read the plugins.lua file when it's updated.
local _packer;
local packer = function()
  if _packer == nil then
    _packer = load_packer()
  end

  return _packer
end

if not custom then
  packer()
end

-- this function handles vim command arguments
-- which will pass actual arguments inside a fat table with tons of extra info
-- e.g. whether 'bang' was used on command
-- we also support empty args for calling commands without arguments
local function _fargs(args, bang)
  if args and args.fargs then
    if bang then
      args.fargs[#args.fargs+1] = args.bang
    end
    return unpack(args.fargs)
  else
    return args
  end
end


-- TODO: add a commands to reload packer
-- vim.cmd [[command! -nargs=+ -complete=customlist,v:lua.require'packer.snapshot'.completion.create PackerSnapshot  lua require('packer').snapshot(<f-args>)]]
-- vim.cmd [[command! -nargs=+ -complete=customlist,v:lua.require'packer.snapshot'.completion.rollback PackerSnapshotRollback  lua require('packer').rollback(<f-args>)]]
-- vim.cmd [[command! -nargs=+ -complete=customlist,v:lua.require'packer.snapshot'.completion.snapshot PackerSnapshotDelete lua require('packer.snapshot').delete(<f-args>)]]

-- vim.cmd [[command! -nargs=* -complete=customlist,v:lua.require'packer'.plugin_complete packerinstall lua require('packer').install(<f-args>)]]
-- vim.cmd [[command! -nargs=* -complete=customlist,v:lua.require'packer'.plugin_complete PackerUpdate lua require('packer').update(<f-args>)]]
-- vim.cmd [[command! -nargs=* -complete=customlist,v:lua.require'packer'.plugin_complete PackerSync lua require('packer').sync(<f-args>)]]
local function PluginComplete(...) return packer().plugin_complete(...) end
local function PackerInstall(args) packer().install(_fargs(args)) end
local function PackerUpdate(args) packer().update(_fargs(args)) end
local function PackerSync(args) packer().sync(_fargs(args)) end
if custom then
  vim.api.nvim_create_user_command('PackerInstall', PackerInstall, { nargs = '*', complete = PluginComplete })
  vim.api.nvim_create_user_command('PackerUpdate', PackerUpdate, { nargs = '*', complete = PluginComplete })
  vim.api.nvim_create_user_command('PackerSync', PackerSync, { nargs = '*', complete = PluginComplete })
end

-- vim.cmd [[command! PackerClean             lua require('packer').clean()]]
-- vim.cmd [[command! -nargs=* PackerCompile  lua require('packer').compile(<q-args>)]]
-- vim.cmd [[command! PackerStatus            lua require('packer').status()]]
-- vim.cmd [[command! PackerProfile           lua require('packer').profile_output()]]
local function PackerClean() packer().clean() end
local function PackerCompile() packer().compile() end
local function PackerStatus() packer().status() end
local function PackerProfile() packer().profile_output() end
if custom then
  vim.api.nvim_create_user_command('PackerClean', PackerClean, {})
  vim.api.nvim_create_user_command('PackerCompile', PackerCompile, {}) -- compile's argument is file to write to. I don't need that ;)
  vim.api.nvim_create_user_command('PackerStatus', PackerStatus, {})
  vim.api.nvim_create_user_command('PackerProfile', PackerProfile, {})
end

-- vim.cmd [[command! -bang -nargs=+ -complete=customlist,v:lua.require'packer'.loader_complete PackerLoad lua require('packer').loader(<f-args>, '<bang>' == '!')]]
local function LoaderComplete(...) return packer().loader_complete(...) end
local function PackerLoad(args) packer().loader(_fargs(args, true)) end
if custom then
  vim.api.nvim_create_user_command('PackerLoad', PackerLoad, {nargs = '+', bang = true, complete = LoaderComplete})
end


-- print(vim.inspect(_my))

if _my.packer.updated then
  -- packer was just initially installed
  PackerSync()

elseif "" == vim.fn.glob(COMPILED) then
  -- can't find the compiled file
  PackerCompile()

end
