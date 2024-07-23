# The image name for the Docker container
IMAGE_NAME = mage_demo

# The name of the Docker Compose file
COMPOSE_FILE = docker-compose.yaml

# Build the Docker image
build:
	docker build -t $(IMAGE_NAME) .

# Run the containers in the background
up:
	docker-compose -f $(COMPOSE_FILE) up -d

# Stop the containers
down:
	docker-compose -f $(COMPOSE_FILE) down

# Open the browser (Linux-compatible)
browse:
	xdg-open http://localhost:6789 || sensible-browser http://localhost:6789 || \
	python -m webbrowser "http://localhost:6789"

# Create new project
create:
	docker run -it -p 6789:6789 \
		-v $(HOME)/DataProjects/mageLocalDataPipeline:/home/src \
		mageai/mageai \
		/app/run_app.sh mage start $(IMAGE_NAME)

# Display help information
help:
	@echo "Available targets:"
	@echo "  build   - Build the Docker image"
	@echo "  up      - Start the containers"
	@echo "  down    - Stop the containers"
	@echo "  browse  - Open the browser to the Mage AI interface"
	@echo "  create  - Create a new Mage AI project"
	@echo "  help    - Display this help message"

.PHONY: build up down browse create help