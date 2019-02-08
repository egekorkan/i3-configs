#!/bin/bash

artistInfo=$(spotify-now -i "%artist")
titleInfo=$(spotify-now -i "%title")
percentagePos=`expr index "$lightInfo" %`


echo ${artistInfo} "|" ${titleInfo}
