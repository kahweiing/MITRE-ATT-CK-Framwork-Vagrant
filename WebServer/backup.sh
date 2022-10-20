#!/bin/sh
FILENAME="dev=$(date +%s).tar.gz"
 
cd /tmp;
tar zcf /var/www/html/$FILENAME *;
chmod 640 /var/www/html/$FILENAME;
