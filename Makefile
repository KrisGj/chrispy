.PHONY: help build run start stop shell logs

default: help

help: ## Shows a list of all the available commands.
	@echo
	@fgrep -h " ## " $(MAKEFILE_LIST) | fgrep -v fgrep | sed -Ee 's/([a-z.]*):[^#]*##(.*)/\1##\2/' | column -t -s "##"
	@echo

build: ## Builds the Docker image for the application using docker-compose.
	docker compose build

run: start logs ## Starts the application and streams logs

start: ## Starts the application using docker-compose.
	docker compose up --build -d

stop: ## Stops the running application using docker-compose.
	docker compose down

shell: ## Shells into a running application Docker container.
	docker exec -it chrispy /bin/bash

logs: ## Follows the logs from the container.
	docker compose logs -f
