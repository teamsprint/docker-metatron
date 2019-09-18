#!/bin/bash

docker build -t teamsprint/metatron:3.3.0 --build-arg METATRON_TAR=`ls metatron-discovery-*.tar.gz` .

