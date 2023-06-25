
DEFAULT ?= help
default: ${DEFAULT}
.PHONY: default

none    = [0m
bold    = [1m
black   = [1m[30m
red     = [1m[31m
green   = [1m[32m
yellow  = [1m[33m
blue    = [1m[34m
magenta = [1m[35m
cyan    = [1m[36m
white   = [1m[37m

##@ TARGETS

help:: ## print help
	@awk 'BEGIN {FS = ":.*##"; printf "\nUsage:\n\n  make ${cyan}<target>${none}\n"}  /^[a-zA-Z_\/%$${}.-]+:.*?##/ { printf "\n  ${cyan}%-15s${none}%s\n", $$1, $$2 } /^## / { printf "  %-15s%s\n", "", substr($$0, 3) } /^##@/ { printf "\n${white}%s${none}\n", substr($$0, 5) } ' $(MAKEFILE_LIST)
.PHONY: help

reset: ## remove and re-create .xdg
	rm -rf .xdg
	direnv exec / $${SHELL} -ic "cd ${PWD}"
.PHONY: reset
