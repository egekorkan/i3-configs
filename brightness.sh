#!/bin/bash

lightInfo=$(brightnessctl -m)
percentagePos=`expr index "$lightInfo" %`
#echo $percentagePos
#echo $lightInfo

echo ${lightInfo:$percentagePos-3:3}   

