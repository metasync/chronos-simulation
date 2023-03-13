include Makefile.env

build.simulator:
	@${CONTAINER_CLI} build . \
		-t ${SIMULATOR_IMAGE} \
		--build-arg CHRONOS_IMAGE_TAG=${CHRONOS_IMAGE_TAG} \
		--build-arg PROJECT=$(project)

run.simulator:
	@${CONTAINER_CLI} run --rm -it \
		${SIMULATOR_IMAGE} /bin/sh

up:
	@${CONTAINER_CLI} compose up -d
up.dev:
	@${CONTAINER_CLI} compose -f docker-compose.yml -f docker-compose.dev.yml up -d
down:
	@${CONTAINER_CLI} compose down
ps:
	@${CONTAINER_CLI} ps -a
logs:
	@${CONTAINER_CLI} compose logs -f

up.chronos:
	@${CONTAINER_CLI} compose up chronos -d
shell.chronos:
	@${CONTAINER_CLI} compose exec chronos /bin/sh
restart.chronos:
	@${CONTAINER_CLI} compose restart chronos
logs.chronos:
	@${CONTAINER_CLI} compose logs chronos -f

shell.opsdb:
	@${CONTAINER_CLI} compose exec opsdb /bin/bash
logs.opsdb:
	@${CONTAINER_CLI} compose logs opsdb -f

shell.hmsdb:
	@${CONTAINER_CLI} compose exec hmsdb /bin/bash
logs.hmsdb:
	@${CONTAINER_CLI} compose logs hmsdb -f

reset:
	@${CONTAINER_CLI} volume rm \
		mssql_chronos_sim_opsdb \
		mssql_chronos_sim_hmsdb

.PHONY: up up.dev down ps logs \
		up.chronos shell.chronos restart.chronos logs.chronos \
		shell.opsdb logs.opsdb \
		shell.hmsdb logs.hmsdb \
		reset
