default: help

.PHONY: help
help: # Show help for each of the Makefile recipes. 
	@grep -E '^[a-zA-Z0-9.-]+:.*#'  Makefile | sort | while read -r l; do printf "\033[34m$$(echo $$l | cut -f 1 -d':')\033[00m:$$(echo $$l | cut -f 2- -d'#')\n"; done

.PHONY: ruby
ruby: # Creates a container with Ruby
	@docker-compose run --rm ruby bash

.PHONY: python
python: # Creates a container with Python
	@docker-compose run --rm python bash

.PHONY: stk
stk: # Creates a container with Stklos
	@docker-compose run --rm stk ash
