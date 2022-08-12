#!/bin/bash
# FUNCTION: wifi restart
# ARGUMENTS: /
# REQUIRES: nmcli

# Check dependencies

if ! command -v nmcli > /dev/null 2>&1
then
	echo "ERROR: nmcli is unavailable."
	exit 1
fi

# Toggle wifi

nmcli radio wifi off;
nmcli radio wifi on;