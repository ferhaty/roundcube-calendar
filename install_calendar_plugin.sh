#!/bin/bash

# ./install_calendar_plugin.sh <path to roundcube>

cd /tmp
#yum install git -y
git clone https://git.kolab.org/diffusion/RPK/roundcubemail-plugins-kolab.git

# For older versions of Roundcube (e.g. 1.0.1)
#cd roundcubemail-plugins-kolab
#git checkout tags/roundcubemail-plugins-kolab-3.1.14

cd $1/plugins/
cp -r /tmp/roundcubemail-plugins-kolab/plugins/calendar .
cp -r /tmp/roundcubemail-plugins-kolab/plugins/libcalendaring .
cd calendar/
cp config.inc.php.dist config.inc.php

echo "Inserting calendar database tables..."
read -e -p "MySQL Host: " -i "127.0.0.1" MYSQLHOST
read -e -p "MySQL Port: " -i "3306" MYSQLPORT
read -e -p "MySQL User: " MYSQLUSER
read -e -p "MySQL Password: " MYSQLPASS
read -e -p "MySQL Database: " MYSQLDB

mysql -h $MYSQLHOST -u $MYSQLUSER -p$MYSQLPASS -P $MYSQLPORT $MYSQLDB < drivers/database/SQL/mysql.initial.sql
cd ../../
chmod 777 config/config.inc.php
vi config/config.inc.php -c ":$"
chmod 440 config/config.inc.php
