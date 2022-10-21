#!/bin/sh
FILENAME="dev=$(date +%s).tar.gz"
 
cd /var/www/html;
tar zcf /var/www/html/$FILENAME *;
chmod 640 /var/www/html/$FILENAME;
