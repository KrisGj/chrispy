.PHONY: help start stop

default: help

help: ## Shows a list of all the available commands.
	@echo
	@fgrep -h " ## " $(MAKEFILE_LIST) | fgrep -v fgrep | sed -Ee 's/([a-z.]*):[^#]*##(.*)/\1##\2/' | column -t -s "##"
	@echo

start: ## Starts the application.
	export FLASK_APP=app; \
    flask run

stop: ## Stops the running application.
	pkill -f "flask run"
