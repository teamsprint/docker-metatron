# Metatron Docker Image (Fully Engineered)

teamsprint/metatron:3.3.0

[![DockerPulls](https://img.shields.io/docker/pulls/teamsprint/docker-metatron.svg)](https://registry.hub.docker.com/u/teamsprint/docker-metatron/)
[![DockerStars](https://img.shields.io/docker/stars/teamsprint/docker-metatron.svg)](https://registry.hub.docker.com/u/teamsprint/docker-metatron/)

# Based on (in a row)

teamsprint/centos:7<br/>
teamsprint/jdk:8<br/>
teamsprint/hadoop:2.7.3<br/>
teamsprint/mysql:5.7<br/>
teamsprint/hive:2.3<br/>
teamsprint/druid:0.9.1

# Build the image

run build.sh

# Start a container

run run.sh

The container name is "metatron". If you don't want, just edit the scripts.

# Attach a container

run attach.sh

# Destroy containers

run destroy.sh

# IMPORTANT: After attach you might to want to to:
./start-hadoop.sh (HDFS & Yarn)<br/>
./test-hadoop.sh (Optional)<br/>

./init-mysql.sh (MySQL setting)<br/>

./start-mysql.sh (optional)<br/>
./conn-mysql.sh (Optional)<br/>

./init-hive-metastore.sh<br/>
./start-hive.sh<br/>

cd $DRUID_HOME<br/>
./start-single.sh<br/>

cd $METATRON_HOME<br/>
bin/metatron.sh --init start<br/>

# Stop Metatron

bin/metatron.sh stop

# WARNING: DOCKER DEFAULT MEMORY SHOULD BE >= 4G

# Test
# When you run by run.sh, Metatron Discovery is at localhost:18180
# You can see other ports in run.sh

