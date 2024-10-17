#!/bin/bash

# Function to print the title of the active window
print_active_window() {
    # Get the active window ID using xprop
    active_window_id=$(xprop -root _NET_ACTIVE_WINDOW | awk -F' ' '{print $5}')
    
    # Use xdotool to get the active window's title
    if [[ "$active_window_id" != "0x0" ]]; then
        active_window_title=$(xdotool getwindowname "$active_window_id")
        echo "$active_window_title"
    else
        echo "Desktop"  # In case no window is focused (root desktop)
    fi
}

# Initial output of the current active window title
print_active_window

# Listen for changes to the _NET_ACTIVE_WINDOW property using xprop
xprop -root -spy _NET_ACTIVE_WINDOW | while IFS= read -r line; do
    print_active_window
done
