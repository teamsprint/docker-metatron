#!/bin/bash

set -x

./hadoop-start.sh
./init-pw.sh
./init-db.sh
./init-polaris.sh
cd $DRUID_HOME
./start-single.sh
cd $METATRON_HOME
bin/metatron.sh --init start
tail -f logs/*

