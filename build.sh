#!/bin/bash

sudo docker build -t teamsprint/metatron:3.3.1 --build-arg METATRON_TAR=`ls metatron-discovery-*.tar.gz` .

