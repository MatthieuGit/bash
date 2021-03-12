#!/bin/bash
# FUNCTION: Mount or unmount usb device to library
# ARGUMENTS: none
# AUTHOR: Jeremy Lanssiers
# COPYRIGHT: 2021 GNU
# VERSION: 1.0
# REQUIRES: mount

# Check arguments

if [ -z "$1" ] || [[ ( $1 != "mount"  ) && ( $1 != "umount" ) ]]
then
	echo "USAGE: libmount [mount/umount]"
	exit 1
fi

# Set variables

DEVICE=$(blkid | egrep -o '\/dev\/(.*)\:\ LABEL="MYUSB"')

DEVICE=$(echo $DEVICE | egrep -o '\/dev\/[a-zA-Z0-9]{1,10}')

LIBRARY=/media/library

# Mount or unmount library

if [ $1 = "mount" ]
then
	mount $DEVICE $LIBRARY
	exit 0
fi

if [ $1 = "umount" ]
then
	umount $DEVICE $LIBRARY
	exit 0
fi

exit 1
