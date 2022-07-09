#!/bin/bash
# FUNCTION: Check if a website is up or down
# ARGUMENTS: /
# AUTHOR: Jeremy Lanssiers
# COPYRIGHT: 2021 GNU
# REQUIRES: curl

site="";

if [ "$#" -eq 1 ]
then
	site="$1"
fi

if [ "$#" -ne 1 ]
then
    echo "USAGE: checkWebServer [url]"
    return 1 2>/dev/null
exit 1
fi

if curl -s -o /dev/null "$site"
then
	echo "$site is up"
else 
	echo "$site is down"
fi

exit 0