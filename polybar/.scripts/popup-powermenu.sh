#!/bin/sh

case "$1" in
    --popup)
        ~/.config/eww/scripts/launch_custom_window.sh dash

        # selected=$(echo "⏻  Shutdown
        # 󰁪  Restart
        #   Suspend
        # 󰍃  Log Out" | rofi -dmenu -p "Power Options")

        # case "$selected" in
        #     Shutdown)
        #        systemctl poweroff
        #         ;;
        #     Reboot)
        #        systemctl  reboot
        #         ;;
        #     Suspend)
        #        systemctl suspend
        #         ;;
        #     Logout)
        #         xfce4-session-logout
        #         ;;
        # esac
        ;;
    *)
        echo "󰡃 "
        ;;
esac

# # !/bin/bash

# selected=$(echo "Shutdown
# Restart" | rofi -dmenu -p "Power Options")

# if [ "$selected" == "Shutdown" ]
# then
# 	# do something
	
# elif [ "$selected" == "Restart" ]
# then
# 	# do something
	
# else
# 	# do something
# fi