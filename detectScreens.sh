#/bin/bash

# connectedScreens=$(eval "$xrandr -q | grep ' connected'")
connectedScreens=$(xrandr -q | grep ' connected')
# wc -l counts line nbs
edp1=false #laptop screen
dp11=false #left 4k screen
dp12=false #wide screen

echo ${connectedScreens}

if [[ $connectedScreens == *"eDP-1"* ]]; then
  echo "It's there!"
  edp1=true
fi

if [[ $connectedScreens == *"DP-1-1"* ]]; then
  echo "It's there! 1"
  dp11=true

fi

if [[ $connectedScreens == *"DP-1-2"* ]]; then
  echo "It's there! 2"
  dp12=true
fi

echo ${edp1} ${dp11} ${dp12}

if [[ $edp1 = true ]] && [[ $dp11 = true ]] && [[ $dp12 = true ]]
then
	echo "all three!"
	source ~/git/i3-configs/work-displays-3.sh
elif [[ $edp1 = true ]] && [[ $dp11 = true ]] && [[ $dp12 = false ]] 
then
	echo "main and wide"
	source ~/git/i3-configs/work-displays-2.sh
elif [[ $edp1 = true ]] && [[ $dp11 = false ]] && [[ $dp12 = false ]]
then
	echo "only main"
	source ~/git/i3-configs/justlaptop.sh
else
	echo "none!"
fi