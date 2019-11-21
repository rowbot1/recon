#!/bin/bash
# a basic script to pull information from crt and present it
# example ./crt.sh offsecnewbie.com
# author rowbot
if [[ $# -eq 0 ]] ;

then
	echo "Usage: ./crt.sh domain. Also you might have to install jq - 'apt get install jq'"
	exit 1

else

curl -s https://crt.sh/\?q\=\%.$1\&output\=json | jq -r '.[].name_value' | sed 's/\*\.//g' | sort -u > $1

fi
