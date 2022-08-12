#!/bin/bash
# FUNCTION: Updates SSL certificates
# ARGUMENTS: none
# REQUIRES:

location="mydestination/"
log="log.txt"

cp --remove-destination /fullchain.pem/ $location
cp --remove-destination /privkey.pem/ $location

chown -R user:user $location

echo Last update - $(date) >> $location$log

exit 0