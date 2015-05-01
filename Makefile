NAME=base

build: clean
	docker build -t ${NAME} --force-rm $(filter-out $@,$(MAKECMDGOALS))

tag:
	docker tag -f ${NAME} metakungfu/${NAME}

sh:
	docker run -it --rm ${NAME} sh

release:
	docker push metakungfu/${NAME}

clean_containers:
	IDLE_CONTAINERS="$(shell docker ps -a | env -i grep -v Up | tail -n+2 | cut -d ' ' -f 1)" \
	&& docker rm -fv  $$IDLE_CONTAINERS 2>/dev/null; true

clean_images:
	UNTAGED_IMAGES="$(shell docker images | env -i grep '^<none>' | awk '{print $$3}')" \
	&& docker rmi -f $$UNTAGED_IMAGES 2>/dev/null; true

clean: clean_containers clean_images
