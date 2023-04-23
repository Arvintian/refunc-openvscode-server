VERSION	= 1.77.3
IMAGE	= refunc/refunc-openvscode-server
ARCHITECTURES = amd64
IMAGE_NAMES += $(foreach arch, $(ARCHITECTURES), $(IMAGE)-$(arch):$(VERSION))
LATEST_IMAGE_NAMES += $(foreach arch, $(ARCHITECTURES), $(IMAGE)-$(arch):latest)

.PHONY: build
build:
	for ARCH in $(ARCHITECTURES) ; do \
		docker buildx build \
			-t $(IMAGE)-$$ARCH:$(VERSION) \
			--platform linux/$$ARCH \
			. ; \
	done ;

.PHONY: push
push:
	for ARCH in $(ARCHITECTURES) ; do \
		docker push $(IMAGE)-$$ARCH:$(VERSION) ; \
	done ;
	docker manifest create --amend $(IMAGE):$(VERSION) $(IMAGE_NAMES)
	docker -D manifest push $(IMAGE):$(VERSION)
	
.PHONY: latest
push-latest:
	for ARCH in $(ARCHITECTURES) ; do \
		docker tag $(IMAGE)-$$ARCH:$(VERSION) $(IMAGE)-$$ARCH:latest; \
		docker push $(IMAGE)-$$ARCH:latest ; \
	done ;
	docker manifest create --amend $(IMAGE):latest $(LATEST_IMAGE_NAMES)
	docker -D manifest push $(IMAGE):latest