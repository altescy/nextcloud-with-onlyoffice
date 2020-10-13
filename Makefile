PWD = $(shell pwd)
DOCKER = docker
DOCKER_COMPOSE = docker-compose
NEXTCLOUD_CONTAINER = nextcloud-app-server

all: build

.PHONY: clean-all
clean-all:
	$(DOCKER_COMPOSE) down --rmi all --volume

.PHONY: clean
clean:
	$(DOCKER_COMPOSE) down

.PHONY: build
build:
	$(DOCKER_COMPOSE) up -d

.PHONY: onlyoffice
onlyoffice:
	$(DOCKER) exec -u www-data $(NEXTCLOUD_CONTAINER) php occ --no-warnings app:install onlyoffice
	$(DOCKER) exec -u www-data $(NEXTCLOUD_CONTAINER) php occ --no-warnings config:system:set onlyoffice DocumentServerUrl --value="/ds-vpath/"
	$(DOCKER) exec -u www-data $(NEXTCLOUD_CONTAINER) php occ --no-warnings config:system:set onlyoffice DocumentServerInternalUrl --value="http://onlyoffice-document-server/"
	$(DOCKER) exec -u www-data $(NEXTCLOUD_CONTAINER) php occ --no-warnings config:system:set onlyoffice StorageUrl --value="http://nginx/"
	$(DOCKER) exec -u www-data $(NEXTCLOUD_CONTAINER) php occ --no-warnings config:system:set allow_local_remote_servers  --value=true

.PHONY: https
https:
	$(DOCKER) exec -u www-data $(NEXTCLOUD_CONTAINER) php occ --no-warnings config:system:set overwriteprotocol  --value=https
