#!/bin/bash
#
# Output temperature

temperature=$(cat /sys/class/thermal/thermal_zone0/temp)
temperature=$(echo "scale=2 ; $temperature / 1000" | bc)
echo $temperature "°C"