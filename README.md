# Chronos Simulation

This repository is used to setup simulation for Chronos to demonstrate how to manage data archive process.

## Pre-requisites

### Build Chronos image

First, clone the simulation repository:

```
git clone https://github.com/metasync/chronos-simulation.git
```

Then, you can build the Chronos image:

```
cd /path/to/chronos-simulation
cd docker
make build.chronos
```

or you can pull it from Quay:

```
# by Podman
podman pull quay.io/chimanlei/chronos

# by Docker
docker pull quay.io/chimanlei/chronos
```

### Build Ruby image (development only)

This step is needed when you need to develop Chronos. 

First, clone the simulation repository:

```
git clone https://github.com/metasync/chronos-simulation.git
```

Then, you can build the Ruby image:

```
cd /path/to/chronos-simulation
cd docker
make build.ruby
```

or you can pull it from Quay:

```
# by Podman
podman pull quay.io/chimanlei/ruby

# by Docker
docker pull quay.io/chimanlei/ruby
```

## Run simulation (MSSQL)

First start up chronos, opsdb and hmsdb with docker-compose:

```
cd /path/to/chronos-simulation
cd mssql
make up
```

Then, you can check the logs to ensure databases are up and running:

```
make logs
```

After the databases are ready, you can get into Chronos container:

```
make shell.chronos
cd simulator
```

If this is the first time you start Chronos simulation, you need to setup database migration before starting the simulation:

```
chronos -c config/config.yml setup
chronos -c config/config.yml migration
```

Sub-command "setup" is to create Chronos database schemas. Sub-command "migration" is to create ops and hms database schemas.

Now you can start the simulation:

```
chronos -c config/config.yml jobs
```
