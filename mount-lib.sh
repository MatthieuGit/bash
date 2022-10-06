#!/bin/bash
#
# Mount or unmount usb device to library. Use in combination with rc.local at /etc/rc.local

# Check arguments

if [ -z "$1" ] || [[ ( $1 != "mount"  ) && ( $1 != "umount" ) ]]; then
	echo "USAGE:""${FUNCNAME[0]}"" [mount/umount] [device]"
	exit 1
fi

# Set variables

device=$(blkid | egrep -o '\/dev\/(.*)\:\ LABEL="MYUSB"')

device=$(echo $device | egrep -o '\/dev\/[a-zA-Z0-9]{1,10}')

library=/media/library

# Mount or unmount library

if [ $1 = "mount" ]; then
	mount $device $library
	exit 0
fi

if [ $1 = "umount" ]; then
	umount $device $library
	exit 0
fi

exit 1