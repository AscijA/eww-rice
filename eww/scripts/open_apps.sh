#!/bin/bash

close_cc() {
	
	eww open --toggle backdrop_closer_controlcenter 
	eww open --toggle controlcenter
}

spawn_nmtui(){
	# kitty nmtui 
	# sleep 0.5 # Give Kitty some time to start
	# wmctrl -r 'nmt' -e 0,1900,40,300,600
}

if [[ "$1" == "--bt" ]]; then
  close_cc && blueman-manager  
elif [[ "$1" == "--stt" ]]; then
	xfce4-settings-manager
elif [[ "$1" == "--audio" ]]; then
	close_cc && pavucontrol
elif [[ "$1" == "--wifi" ]]; then
	nm-connection-editor
elif [[ "$1" == "--nmd" ]]; then
	spawn_nmtui
fi
