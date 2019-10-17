#!/bin/bash

IMAGE_NAME=teamsprint/metatron:3.3.0
CONTAINER_NAME=metatron

sudo docker run -d -it --name $CONTAINER_NAME \
           -p 18088:8088 \
           -p 18042:8042 \
           -p 18081:8081 \
           -p 18082:8082 \
           -p 18090:8090 \
           -p 18091:8091 \
           -p 18180:8180 \
           --privileged $IMAGE_NAME /usr/sbin/init
sudo docker exec -it $CONTAINER_NAME /bin/bash

