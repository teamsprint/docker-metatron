# Druid for Metatron Docker image

teamsprint/metatron:3.3.0

[![DockerPulls](https://img.shields.io/docker/pulls/teamsprint/docker-metatron.svg)](https://registry.hub.docker.com/u/teamsprint/docker-metatron/)
[![DockerStars](https://img.shields.io/docker/stars/teamsprint/docker-metatron.svg)](https://registry.hub.docker.com/u/teamsprint/docker-metatron/)

# Based on (in a row)

teamsprint/centos:7
teamsprint/jdk:8
teamsprint/hadoop:2.7.3
teamsprint/mysql:5.7
teamsprint/hive:2.3
teamsprint/druid:0.9.1

# Build the image

run build.sh

# Start a container

run run.sh

The container name is "druid". If you don't want, just edit the scripts.

# Attach a container

run attach.sh

# Destroy containers

run destroy.sh

# IMPORTANT: After attach you might to want to to:
./hadoop-start.sh
./hadoop-test.sh    (Optional)
./init-pw.sh (MySQL setup)
./init-db.sh (Hive metastore setup)
./init-polaris.sh (Metatron DB setup)

cd $DRUID_HOME
./start-single.sh   (Mandatory)

cd $METATRON_HOME
bin/metatron.sh --init start

# Stop Metatron

bin/metatron.sh stop

# WARNING: DOCKER DEFAULT MEMORY SHOULD BE >= 4G
