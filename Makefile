DOCKER_COMPOSE = docker-compose
DOCKER = docker

build:
	$(DOCKER_COMPOSE) up --build -d

start:
	$(DOCKER_COMPOSE) up -d

stop:
	$(DOCKER_COMPOSE) down
prune:
	@echo "Pruning Docker..."
	$(DOCKER) system prune -f
	$(DOCKER) volume prune -f
	$(DOCKER) network prune -f
	@volumes=$($(DOCKER) volume ls -q); \
	if [ -n "$$volumes" ]; then \
	  $(DOCKER_COMPOSE) volume rm $volumes; \
	else \
	  echo "No Docker volumes to remove."; \
	fi
