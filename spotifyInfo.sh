#!/bin/bash

artistInfo=$(spotify-now -i "%artist")
titleInfo=$(spotify-now -i "%title")


echo ${artistInfo} "|" ${titleInfo}
