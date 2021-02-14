#!/bin/bash
# FUNCTION: Identify a specific usb
# ARGUMENTS: none
# AUTHOR: jlanssie@gmail.com
# COPYRIGHT: 2021 GNU
# VERSION: 1.0
# REQUIRES:

LIB=$(blkid | egrep -o '\/dev\/(.*)\:\ LABEL="MYUSB"')

LIB=$(echo $LIB | egrep -o '\/dev\/[a-zA-Z0-9]{1,10}')

echo $LIB

exit 0
