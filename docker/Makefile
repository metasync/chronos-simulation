include Makefile.env

build.chronos:
	@${CONTAINER_CLI} build . \
		-t $(CHRONOS_IMAGE) \
		--build-arg RUBY_IMAGE_TAG=${RUBY_IMAGE_TAG}

build.ruby:
	@${CONTAINER_CLI} build . \
		-f Dockerfile.dev \
		-t $(RUBY_IMAGE) \
		--build-arg RUBY_IMAGE_TAG=${RUBY_IMAGE_TAG}

push.chronos:
	@${CONTAINER_CLI} push $(CHRONOS_IMAGE)

push.ruby:
	@${CONTAINER_CLI} push $(RUBY_IMAGE)

dev:
	@${CONTAINER_CLI} run --rm -it \
		-v $(SRC_PATH):$(WORKDIR) \
		-v $(SRC_PATH)/bundle:$(BUNDLE_PATH) \
		${RUBY_IMAGE} /bin/sh

run:
	@${CONTAINER_CLI} run --rm -it \
		-v $(SRC_PATH):$(WORKDIR) \
		${CHRONOS_IMAGE} /bin/sh

prune:
	@${CONTAINER_CLI} image prune -f

clean: prune

.PHONY: build.chronos build.ruby \
		push.chronos push.ruby \
		dev run prune clean
