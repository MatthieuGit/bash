#!/bin/bash
# FUNCTION: Cleanup machine
# ARGUMENTS: /
# AUTHOR: Jeremy Lanssiers
# COPYRIGHT: 2022 GNU
# REQUIRES: /

home_dir=$(echo ~)

#### Screenshots

mac_screenshots="$home_dir""/Pictures/Screenshots/*"

rm -rf $(echo "$mac_screenshots")