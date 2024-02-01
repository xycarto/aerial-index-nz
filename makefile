
BASEIMAGE := xycarto/aerial-index-nz
IMAGE := $(BASEIMAGE):2024-02-01

RUN ?= docker run -i --rm  \
	-u $$(id -u):$$(id -g) \
	-e DISPLAY=$$DISPLAY \
	-e RUN= \
	-v$$(pwd):/work \
	--net=host \
	-w /work $(IMAGE)


##### LINZ Indexing #####
get-data:
	$(RUN) python3 src/get-data.py $(region) $(workunit)

get-regions:
	$(RUN) python3 src/get-regions.py

list-region:
	$(RUN) python3 src/list-region.py $(region)

index-region:
	$(RUN) bash builds/index-region.sh $(region)

merge-region:
	$(RUN) bash src/merge-region.sh $(region)

all-regions:
	$(RUN) bash builds/index-all-region.sh

##### DOCKER #####

local-edit: docker/Dockerfile
	docker run -it --rm --net=host \
	--user=$$(id -u):$$(id -g) \
	-e DISPLAY=$$DISPLAY \
	-e RUN= \
	-v$$(pwd):/work \
	-w /work \
	$(IMAGE)
	bash
	
docker-local: docker/Dockerfile
	docker build --tag $(BASEIMAGE) - < docker/Dockerfile && \
	docker tag $(BASEIMAGE) $(IMAGE)

docker: docker/Dockerfile
	docker build --tag $(BASEIMAGE) - < docker/Dockerfile && \
	docker tag $(BASEIMAGE) $(IMAGE) && \
	docker push $(IMAGE)

docker-pull:
	docker pull $(IMAGE)

