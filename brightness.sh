#!/bin/bash

lightInfo=$(brightnessctl -m)
percentagePos=`expr index "$lightInfo" %`
#echo $percentagePos
#echo $lightInfo



if [[ $lightInfo == *"100%"* ]]; then
  echo  ${lightInfo:$percentagePos-4:4}
else
  echo  ${lightInfo:$percentagePos-3:3}
fi