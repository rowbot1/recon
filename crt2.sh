#!/bin/bash
# a basic script to pull information from crt and present it
# example ./crt.sh offsecnewbie.com
# author rowbot

if [[ $# -eq 0 ]] ;

then
	echo "Usage: ./crt.sh domain"
	exit 1

else

curl -s "https://crt.sh/?q=%.$1" -o rawdata; cat rawdata | grep "<TD>" | grep -vE "style" | cut -d ">" -f 2 | grep -Po '.*(?=....$)' | sort -u | grep -v "*" > $1

fi