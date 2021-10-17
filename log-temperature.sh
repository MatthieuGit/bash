#!/bin/bash
# FUNCTION: Echo temperature
# ARGUMENTS: none
# AUTHOR: Jeremy Lanssiers
# COPYRIGHT: 2021 GNU
# VERSION: 1.0
# REQUIRES: thermal sensor

TEMP=$(cat /sys/class/thermal/thermal_zone0/temp)
TEMP=$(echo "scale=2 ; $TEMP / 1000" | bc)
echo $TEMP "°C"