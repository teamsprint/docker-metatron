#!/bin/bash

set -x

cd $METATRON_HOME
bin/metatron.sh start
tail -f logs/*

