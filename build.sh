#!/bin/bash

sudo docker build -t teamsprint/metatron:3.4.0 --build-arg METATRON_TAR=`ls metatron-discovery-*.tar.gz` .

