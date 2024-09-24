
# Function to check Bluetooth status (On/Off)
get_bluetooth_status() {
    BT_STATUS=$(bluetoothctl show | grep "Powered" | awk '{print $2}')

    if [ "$BT_STATUS" == "yes" ]; then
        echo "On"
    else
        echo "Off"
    fi
}

# Function to toggle Bluetooth on/off
toggle_bluetooth() {
    # Check the current Bluetooth status
    BT_STATUS=$(bluetoothctl show | grep "Powered" | awk '{print $2}')

    if [ "$BT_STATUS" == "yes" ]; then
        # Turn off Bluetooth
        bluetoothctl power off
    else
        # Turn on Bluetooth
        bluetoothctl power on
    fi
}

# Function to get the connected Bluetooth device name
get_bluetooth_device_name() {
    DEVICE_NAME=$(bluetoothctl info | grep "Name" | awk -F: '{print $2}' | xargs)

    if [ -n "$DEVICE_NAME" ]; then
        echo "$DEVICE_NAME"
    else
        echo "Disconnected"
    fi
}



# -----------------------------
# Command-line Argument Handling
# -----------------------------

if [[ "$1" == "--tgl" ]]; then
    toggle_bluetooth
elif [[ "$1" == "--name" ]]; then
    get_bluetooth_device_name
elif [[ "$1" == "--sts" ]]; then
    get_bluetooth_status
fi