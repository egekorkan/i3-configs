#!/bin/bash
ifMute=$(pamixer --get-mute)
if [ $ifMute = "true" ]; then
	echo "MUTED"
else
	vol=$(pamixer --get-volume)
	echo $vol
fi
