DEFAULT ?= clean vim
default: ${DEFAULT}
.PHONY: default

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
.PHONY: help


##@ section A

clean: ## clean generated files
	rm -rf pack plugin/packer_compiled.lua
.PHONY: clean

vim: ## run vim
	vim lua/my/plugins.lua
.PHONY: vim


##@ section B

bar: ## this is another task
	echo ok

# $(if ${REVISION},$(info REVISION=${REVISION}),$(error REVISION))

# ifneq ($(wildcard .env.${XXX_ENV}),)
#   include .env.${XXX_ENV}
# endif


# $@
# The file name of the target.
#
# $%
# The target member name, when the target is an archive member.
#
# $<
# The name of the first prerequisite.
#
# $?
# The names of all the prerequisites that are newer than the target, with spaces between them. For prerequisites which are archive members, only the named member is used (see Archives).
#
# $^
# $+
# The names of all the prerequisites, with spaces between them. For prerequisites which are archive members, only the named member is used (see Archives). The value of $^ omits duplicate prerequisites, while $+ retains them and preserves their order.
#
# $*
# The stem with which an implicit rule matches

$@: $< $^
