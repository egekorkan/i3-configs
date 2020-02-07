#!/usr/bin/env bash

MYIP="10.162.253.87"

## check if in Office LAN
if [ "$(/sbin/ip route get 1 | awk '/via/ { print $3;exit }')" != "$MYIP" ]; then
	return
fi 


if [ "$1" == "here" ]; then 
	wget --timeout=3 http://esi4965pi:8080/?desk3=here
fi	

if [ "$1" == "home" ]; then 
	wget --timeout=3 http://esi4965pi:8080/?desk3=home
fi



# exit with error code
exit 0
