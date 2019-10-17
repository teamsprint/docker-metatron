#!/bin/bash

set -x

./start-hadoop.sh

sleep 3
./init-mysql.sh

sleep 3
./init-hive-metastore.sh
./start-hive.sh

sleep 3
cd $DRUID_HOME
./start-single.sh

sleep 3
cd -
./init-metatron.sh

