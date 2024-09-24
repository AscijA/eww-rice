#!/bin/bash

close_cc() {
	
	eww open --toggle backdrop_closer_controlcenter 
	eww open --toggle controlcenter
}

if [[ "$1" == "--bt" ]]; then
  close_cc && blueman-manager  
elif [[ "$1" == "--stt" ]]; then
	xfce4-settings-manager
elif [[ "$1" == "--audio" ]]; then
	close_cc && pavucontrol
elif [[ "$1" == "--wifi" ]]; then
	nm-connection-editor
fi
