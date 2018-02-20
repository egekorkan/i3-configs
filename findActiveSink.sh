#!/bin/bash

# Basically I need to find the active sink and assign it to the default
runningSink=$(pactl list sinks | grep -n "RUNNING" | cut -d : -f 1)
runningSinkNb=0
#echo "The running sink line is $runningSink."
if (( $runningSink < 10 )); then
	runningSinkNb=0
elif (( $runningSink < 100 ));then
	runningSinkNb=1
else
	runningSinkNb=2
fi
pacmd set-default-sink $runningSinkNb
#echo "$runningSinkNb"
#echo "The running sink number is $runningSinkNb."
# #echo "Total number of sinks is $sinkCount."

#pacmd move-sink-input 1 1

# runningSinkNb=${runningSink:0:1} 
# sinkCount=$(pactl list sinks | grep -c "Sink")
