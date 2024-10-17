#!/bin/bash

# Function to get Wi-Fi signal strength using nmcli
get_wifi_strength_nmcli() {
    # Get Wi-Fi signal strength of the connected network
    if nmcli -t -f active dev wifi | grep -q '^yes'; then

        SIGNAL_STRENGTH=$(nmcli -t -f IN-USE,SIGNAL dev wifi | grep '*' | awk -F: '{print $2}')

        if [ -n "$SIGNAL_STRENGTH" ]; then
            echo "$SIGNAL_STRENGTH"
        else
            echo "0"
        fi
    else
        echo "0"
    fi
}

# Function to retrieve the current Wi-Fi SSID name
get_wifi_name_nmcli() {
    # Retrieve the SSID of the connected network
    WIFI_NAME=$(nmcli -t -f active,ssid dev wifi | grep '^yes' | awk -F: '{print $2}')

    if [ -n "$WIFI_NAME" ]; then
        echo "$WIFI_NAME"
    else
        echo "Disconnected"
    fi
}


get_wifi_status(){

WIFI_STATUS=$(nmcli radio wifi)

    if [ "$WIFI_STATUS" == "enabled" ]; then
        echo "On"
    else
        echo "Off"
    fi
}

# Function to toggle Wi-Fi on/off
toggle_wifi() {
    # Check the current Wi-Fi status
    
    WIFI_STATUS=$(nmcli radio wifi)

    if [ "$WIFI_STATUS" == "enabled" ]; then
        # Turn off Wi-Fi
        nmcli radio wifi off
    else
        # Turn on Wi-Fi
        nmcli radio wifi on
    fi
}

if [[ "$1" == "--tgl" ]]; then
	toggle_wifi
elif [[ "$1" == "--name" ]]; then
	get_wifi_name_nmcli
elif [[ "$1" == "--str" ]]; then
    get_wifi_strength_nmcli
elif [[ "$1" == "--sts" ]]; then
    get_wifi_status
fi
