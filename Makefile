DEFAULT ?= help
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

help:: ## print help
	@awk 'BEGIN {FS = ":.*##"; printf "\nUsage:\n\n  make ${cyan}<target>${none}\n\n"}  /^[a-zA-Z_\/%$${}.-]+:.*?##/ { printf "\n  ${cyan}%-15s${none}%s\n", $$1, $$2 } /^## / { printf "  %-15s%s\n", "", substr($$0, 3) } /^##@/ { printf "\n${white}%s${none}\n\n", substr($$0, 5) } ' $(MAKEFILE_LIST)


##@ section A


clean: ## clean compiled config
	rm -rf plugin/packer_compiled.lua
.PHONY: clean

reset: clean ## remove all generated files
	rm -rf pack .xdg/data/nvim .xdg/cache/nvim
.PHONY: reset

sync: clean ## sync packer config
	nvim --headless -c 'autocmd User PackerComplete qa!' -c 'silent PackerSync'
	@echo

compile: clean ## compile packer config
	nvim --headless -c 'autocmd User PackerCompileDone qa!' -c 'silent PackerCompile'
	@echo
.PHONY: compile

.PHONY: default help clean vim sync
