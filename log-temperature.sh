#!/bin/bash
# FUNCTION: Echo temperature
# ARGUMENTS: none
# AUTHOR: Jeremy Lanssiers
# COPYRIGHT: 2021 GNU
# REQUIRES: thermal sensor

temperature=$(cat /sys/class/thermal/thermal_zone0/temp)
temperature=$(echo "scale=2 ; $temperature / 1000" | bc)
echo $temperature "°C"