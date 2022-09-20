#!/bin/bash
#
# Tidy your machine

# General Linux / MacOs destinations

desktop_files="$HOME""/Desktop/*"
downloads="$HOME""/Downloads/*"
screenshots="$HOME""/Pictures/Screen*"

rm -rf $(echo "$desktop_files" "$downloads" "$screenshots")

# MacOS specific destinations

if [ $(uname) == "Darwin" ]
then
	mac_os_trash_1="$HOME""/.Trash/*"
	mac_os_trash_2="$HOME""/Library/Mobile\ Documents/com\~apple\~CloudDocs/.Trash/*"

	rm -rf $(echo "$mac_os_trash_1" "$mac_os_trash_2")
fi