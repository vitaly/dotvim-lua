DEFAULT ?= sync
default: ${DEFAULT}

none    = \033[0m
bold    = \033[1m
black   = \033[1m\033[30m
red     = \033[1m\033[31m
green   = \033[1m\033[32m
yellow  = \033[1m\033[33m
blue    = \033[1m\033[34m
magenta = \033[1m\033[35m
cyan    = \033[1m\033[36m
white   = \033[1m\033[37m

help:: ## This Target
	@awk 'BEGIN {FS = ":.*##"; printf "\nUsage:\n\n  make ${cyan}<target>${none}\n\n"}  /^[a-zA-Z_\/%$${}.-]+:.*?##/ { printf "\n  ${cyan}%-15s${none}%s\n", $$1, $$2 } /^## / { printf "  %-15s%s\n", "", substr($$0, 3) } /^##@/ { printf "\n${white}%s${none}\n\n", substr($$0, 5) } ' $(MAKEFILE_LIST)


##@ section A

clean: ## clean generated files
	rm -rf pack plugin/packer_compiled.lua

vim: ## run vim
	#vim lua/my/plugins/which-key.lua
	# vim lua/my/plugins.lua
	# #vim init.lua
	# vim lua/**/*.lua
	vim foo.ts
	# vim lua/my/plugins/git.lua

sync: ## sync packer config
	rm -f plugin/packer_compiled.lua
	nvim --headless -c 'autocmd User PackerComplete qa!' -c 'silent PackerSync'
	@echo






#
#
#
#
#
#
##
.PHONY: default help clean vim sync
