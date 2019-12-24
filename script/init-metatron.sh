#!/bin/bash

set -x

PASSWORD=Metatron123$

expect -c "
set timeout 3
spawn mysql -uroot -p
expect \"Enter password:\"
send \"$PASSWORD\\r\"
expect \"mysql>\"
send \"create database polaris;\\r\"
expect \"mysql>\"
send \"create user 'polaris'@'%' identified by '$PASSWORD';\\r\"
expect \"mysql>\"
send \"grant all privileges on *.* to 'polaris'@'%';\\r\"
expect \"mysql>\"
send \"grant all privileges on polaris.* to 'polaris'@'%';\\r\"
expect \"mysql>\"
send \"create user 'polaris'@'localhost' identified by '$PASSWORD';\\r\"
expect \"mysql>\"
send \"grant all privileges on *.* to 'polaris'@'localhost';\\r\"
expect \"mysql>\"
send \"grant all privileges on polaris.* to 'polaris'@'localhost';\\r\"
expect \"mysql>\"
send \"flush privileges;\\r\"
expect \"mysql>\"
send \"quit\\r\"
expect eof
"

cd $METATRON_HOME
bin/metatron.sh start

