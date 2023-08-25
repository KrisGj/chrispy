.PHONY: help start stop

IMAGE_NAME = chrispy
CONTAINER_NAME = chrispy-container

default: help

help: ## Shows a list of all the available commands.
	@echo
	@fgrep -h " ## " $(MAKEFILE_LIST) | fgrep -v fgrep | sed -Ee 's/([a-z.]*):[^#]*##(.*)/\1##\2/' | column -t -s "##"
	@echo

build: ## Builds the Docker image for the application.
	docker build -t $(IMAGE_NAME) .

start: build ## Starts the application.
	docker run -p 5000:80 --name $(CONTAINER_NAME) $(IMAGE_NAME)

stop: ## Stops the running application.
	docker stop $(CONTAINER_NAME)
	docker rm $(CONTAINER_NAME)

shell: ## Shells into a running application Docker container.
	docker exec -it $(CONTAINER_NAME) /bin/bash
