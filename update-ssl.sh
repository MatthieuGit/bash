#!/bin/bash
# FUNCTION: Updates SSL certificates
# ARGUMENTS: none
# AUTHOR: Jeremy Lanssiers
# COPYRIGHT: 2021 GNU
# VERSION: 1.0
# REQUIRES:

TARGET="mydestination/"
LOGFILE="log.txt"

cp --remove-destination /fullchain.pem/ $TARGET
cp --remove-destination /privkey.pem/ $TARGET

chown -R user:user $TARGET

echo Last update - $(date) >> $TARGET$LOGFILE

exit 0
