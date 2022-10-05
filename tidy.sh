#!/bin/bash
#
# Tidy your machine

# General file paths

file_paths=("$HOME""/Desktop/*" "$HOME""/Downloads/*" "$HOME""/Pictures/Screen*")

# Linux-specific file paths

if [ $(uname) == "Linux" ]; then
	file_paths+=("$HOME""/.local/share/Trash/files/*")
fi

# MacOS-specific file paths

if [ $(uname) == "Darwin" ]; then
	file_paths+="$HOME""/.Trash/*"
	file_paths+="$HOME""/Library/Mobile\ Documents/com\~apple\~CloudDocs/.Trash/*"
fi

# Remove file paths

for file_path in "${file_paths[@]}"
do
	rm -rf $(echo "$file_path")
done