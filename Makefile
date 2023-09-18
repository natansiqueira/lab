default: help

.PHONY: help
help: # Show help for each of the Makefile recipes. 
	@grep -E '^[a-zA-Z0-9.-]+:.*#'  Makefile | sort | while read -r l; do printf "\033[34m$$(echo $$l | cut -f 1 -d':')\033[00m:$$(echo $$l | cut -f 2- -d'#')\n"; done

.PHONY: ruby.bash
ruby.bash: # Creates a container Bash with Ruby
	@docker-compose run --rm ruby bash

.PHONY: python.bash
python.bash: # Creates a container Bash with Python
	@docker-compose run --rm python bash
